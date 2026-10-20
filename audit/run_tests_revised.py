"""Offline wxsum/wxprep audit. Python standard library + a licensed Stata executable.
Only the supplied folder defines expected behavior. Never modifies that folder.

REVISED COPY (16 Oct 2026) of the auditor's run_tests.py, which is kept unchanged
next to this file. Three changes, all following decisions made after the audit:
  1. spells(): the mid-window spell is the longest run that is neither the
     leading nor the trailing spell when there are at least two break days
     (audit finding B3), so max(start, mid, end) is the longest spell. The
     auditor's oracle used the earlier rule (strictly between the first and last
     break day).
  2. The documented-file check for tests/run_all.do is dropped: the test suites
     are kept out of the distributed package (they live in audit/tests), and the
     README no longer refers to them.
  3. (20 Oct 2026) reference(): deviations and z-scores are expected only for
     the mid-window spells (dry, heat), not for the leading and trailing
     spells, which no longer have them.
Everything else, including all cases and tolerances, is the auditor's.
Usage: python run_tests.py --source "C:/Users/annal/Downloads/wxsum" --stata "C:/Program Files/StataNow19/StataMP-64.exe"
"""
from pathlib import Path
import argparse, bisect, csv, datetime as dt, hashlib, itertools, json, math, random
import statistics, struct, subprocess, sys, time

HERE = Path(__file__).resolve().parent
EPOCH = dt.date(1960, 1, 1)
CASES = []

def q(p):
    return '"' + str(p).replace('\\', '/') + '"'

def case(name, body, group='behavior'):
    CASES.append(dict(name=name, body=body.strip()+'\n', group=group))

def wide(rows, start='20200101'):
    d = dt.datetime.strptime(start, '%Y%m%d').date()
    cols = ['id'] + ['x_'+(d+dt.timedelta(days=j)).strftime('%Y%m%d') for j in range(len(rows[0]))]
    s = ['clear', 'input double ('+' '.join(cols)+')']
    s += [str(i+1)+' '+' '.join('.' if v is None else str(v) for v in row) for i,row in enumerate(rows)]
    return '\n'.join(s+['end'])+'\n'

RAIN = 'wxsum x_, type(rain) ini_month(1) fin_month(1) fin_day(6) keep(id)'
TEMP = 'wxsum x_, type(temp) ini_month(1) fin_month(1) fin_day(6) gdd_lo(10) gdd_hi(30) heat_threshold(30) keep(id)'

def eq(var, val, where=''):
    cond = (' if '+where) if where else ''
    if val is None or not math.isfinite(val):
        return f'assert missing({var}){cond}\n'
    return f'assert !missing({var}) & abs({var} - ({val:.17g})) <= 1e-9 * max(1,abs({val:.17g})){cond}\n'

def spells(a, predicate):
    obs = [i for i,v in enumerate(a) if v is not None]
    if not obs: return (None,)*3
    def run(seq):
        best = n = 0
        for v in seq:
            n = n+1 if v is not None and predicate(v) else 0
            best = max(best,n)
        return best
    lead = 0
    for v in a[obs[0]:]:
        if v is None or not predicate(v): break
        lead += 1
    trail = 0
    for v in reversed(a[:obs[-1]+1]):
        if v is None or not predicate(v): break
        trail += 1
    breaks = [i for i in obs if not predicate(a[i])]
    # revised rule (B3): with >= 2 break days, the longest run that is neither
    # the leading run (it starts on the first observed day) nor the trailing
    # run (it ends on the last observed day); otherwise the longest run anywhere
    if len(breaks) < 2: return lead, run(a), trail
    runs, i = [], 0
    while i < len(a):
        if a[i] is not None and predicate(a[i]):
            j = i
            while j+1 < len(a) and a[j+1] is not None and predicate(a[j+1]): j += 1
            runs.append((i, j)); i = j+1
        else: i += 1
    mid = max([j-i+1 for i,j in runs if i != obs[0] and j != obs[-1]], default=0)
    return lead, mid, trail

def core(series, s, e, typ, minobs=1, edges=(), h=30, k=32):
    days = [s+dt.timedelta(days=i) for i in range((e-s).days+1)]
    a = [series.get(d) for d in days]
    observed = [(d,v) for d,v in zip(days,a) if v is not None]
    vals = [v for _,v in observed]
    n = len(vals)
    keys = ['nobs','mean','median','var','sd','skew']
    keys += ['mean_mo','total','raindays','norain','pct_raindays','dry_start','dry','dry_end'] if typ=='rain' else ['max','gdd','kdd','heatdays','pct_heatdays','heat_start','heat','heat_end']
    result = dict.fromkeys(keys)
    result['nobs']=n
    if n < minobs:
        for b in range(len(edges)+1):
            if edges: result[f'cut{b+1:02}']=None
        return result
    mean = statistics.mean(vals)
    var = statistics.variance(vals) if n>=2 else None
    sd = math.sqrt(var) if var is not None else None
    skew = n/((n-1)*(n-2))*math.fsum(((x-mean)/sd)**3 for x in vals) if n>=3 and sd else None
    result.update(mean=mean,median=statistics.median(vals),var=var,sd=sd,skew=skew)
    if typ=='rain':
        rd = sum(v>=1 for v in vals)
        lead,mid,tail=spells(a,lambda v:v<1)
        result.update(mean_mo=math.fsum(vals)/len({(d.year,d.month) for d,_ in observed}),total=math.fsum(vals),raindays=rd,norain=n-rd,pct_raindays=rd/n,dry_start=lead,dry=mid,dry_end=tail)
    else:
        hd=sum(v>=h for v in vals)
        lead,mid,tail=spells(a,lambda v:v>=h)
        result.update(max=max(vals),gdd=math.fsum(min(max(v-10,0),20) for v in vals),kdd=math.fsum(max(v-k,0) for v in vals),heatdays=hd,pct_heatdays=hd/n,heat_start=lead,heat=mid,heat_end=tail)
    if edges:
        for b in range(len(edges)+1): result[f'cut{b+1:02}']=sum(bisect.bisect_right(edges,v)==b for v in vals)
    return result

def reference(current, refs, refmin, typ):
    # revised (change 3): of the spells, only the mid-window spell
    stems = ['mean_mo','total','raindays','norain','pct_raindays','dry'] if typ=='rain' else ['gdd','kdd','heatdays','pct_heatdays','heat']
    result={}
    for stem in stems:
        v=[r[stem] for r in refs if r[stem] is not None]
        dev=current[stem]-statistics.mean(v) if current[stem] is not None and len(v)>=refmin else None
        sd=statistics.stdev(v) if len(v)>=refmin else None
        result['dev_'+stem]=dev
        result['z_'+stem]=dev/sd if dev is not None and sd else None
    return result

def make_behavior():
    base=wide([[0,1,2,None,0,3],[None]*6,[1]*6])
    case('rain_hand_calculated',base+RAIN+'\n'+''.join(eq(k,v,'id==1') for k,v in dict(nobs=5,total=6,mean=1.2,median=1,var=1.7,sd=math.sqrt(1.7),raindays=3,norain=2,pct_raindays=.6,dry_start=1,dry=1,dry_end=0,mean_mo=6).items())+'assert nobs==0 & missing(total) & missing(dry) if id==2\nassert var==0 & missing(skew) if id==3')
    case('temp_hand_calculated',wide([[0,10,20,30,40,None]])+TEMP+'\n'+''.join(eq(k,v) for k,v in dict(nobs=5,mean=20,median=20,var=250,max=40,gdd=50,kdd=10,heatdays=2,pct_heatdays=.4,heat_start=0,heat=0,heat_end=2).items()))
    case('minobs_and_missing_bins',base+RAIN+' minobs(6) cuts(1 2)\nassert nobs==5 & missing(total) & missing(cut01) if id==1\nassert nobs==0 & missing(total) if id==2\nassert nobs==6 & total==6 & cut02==6 if id==3')
    for name,values in [('singleton',[[None,2,None,None,None,None]]),('all_missing',[[None]*6]),('constant',[[3]*6])]:
        a=values[0]
        c=core({dt.date(2020,1,1)+dt.timedelta(days=i):v for i,v in enumerate(a)},dt.date(2020,1,1),dt.date(2020,1,6),'rain')
        case('rain_'+name,wide(values)+RAIN+'\n'+''.join(eq(k,v) for k,v in c.items()))
    # Exhaust every six-day sequence of missing / spell / break, for both spell engines.
    patterns=list(itertools.product([None,0,1],repeat=6))
    for typ in ['rain','temp']:
        rows=patterns if typ=='rain' else [[None if v is None else (35 if v==0 else 20) for v in row] for row in patterns]
        cmd=RAIN if typ=='rain' else TEMP
        prefix='dry' if typ=='rain' else 'heat'
        text=wide(rows)+cmd+'\n'
        for i,row in enumerate(rows,1):
            sp=spells(row,(lambda v:v<1) if typ=='rain' else (lambda v:v>=30))
            text+=''.join(eq(k,v,f'id=={i}') for k,v in zip([prefix+'_start',prefix,prefix+'_end'],sp))
        case(typ+'_exhaustive_729_spell_patterns',text,'oracle')
    for j in [1,2,4,42]:
        vals=[-5,0,10,20,30,40]
        edges=[] if j==1 else ([15] if j==2 else [0]+[30*b/(j-2) for b in range(1,j-2)]+[30])
        text=wide([vals])+TEMP+f' tmp_bin({j}) tmp_binlo(0) tmp_binhi(30)\n'
        for b in range(j): text+=eq(f'tmpbin{b+1:02}',sum(bisect.bisect_right(edges,v)==b for v in vals))
        text+='egen binsum=rowtotal(tmpbin*)\nassert binsum==nobs\n'
        case(f'temp_bins_{j}',text)
    for typ in ['rain','temp']:
        cmd=RAIN if typ=='rain' else TEMP
        vals=[0,1,2,10,30,None]
        case(typ+'_cuts_edges',wide([vals])+cmd+' cuts(1 2 30)\nassert cut01==1 & cut02==1 & cut03==2 & cut04==1\n')
    case('kdd_separate_base',wide([[20,30,35,40,None,None]])+TEMP+' kdd_base(35)\nassert heatdays==3 & kdd==5 & gdd==70\n')
    case('outstub_and_string_keep',wide([[1]*6,[2]*6])+'gen str5 name="site"+string(id)\n'+RAIN.replace('keep(id)','keep(id name) outstub(r_)')+'\nassert r_total==6*id\nassert name=="site"+string(id)\nconfirm variable year\nconfirm variable r_dry_start\n')
    case('stored_results_and_metadata',base+RAIN+'\nlocal vv `r(varlist)\'\nlocal n : word count `vv\'\nassert r(k_created)==`n\'\nassert r(N)==3 & r(N_units)==3 & r(n_windows)==1\nmatrix M=r(missing)\nassert M[1,1]==6 & abs(M[1,2]-11/3)<1e-12\nassert abs(M[1,3]-2/3)<1e-12 & abs(M[1,4]-1/3)<1e-12 & M[1,5]==1\nlocal stat : char total[wxsum_stat]\nassert "`stat\'"=="total"\nlocal ver : char _dta[wxsum_version]\nassert "`ver\'"=="6.0.0"\nlocal shape : char _dta[wxsum_shape]\nassert "`shape\'"=="long"\n')
    for shape in ['long','wide']:
        case('rollback_forced_'+shape,base+'datasignature\nlocal before `r(datasignature)\'\nglobal WXSUM_TEST_FAIL store\ncapture '+RAIN+f' shape({shape})\nlocal rc=_rc\nglobal WXSUM_TEST_FAIL\nassert `rc\'==9\ndatasignature\nassert "`before\'"=="`r(datasignature)\'"\n')
    for name,cmd,rc in [
        ('type',RAIN.replace('type(rain)','type(other)'),198),
        ('no_mode','wxsum x_, type(rain)',198),
        ('mixed_modes',RAIN+' start(id) end(id)',198),
        ('partial_calendar',RAIN+' partial',198),
        ('bad_month',RAIN.replace('ini_month(1)','ini_month(13)'),198),
        ('fractional_day',RAIN.replace('fin_day(6)','fin_day(1.5)'),198),
        ('invalid_month_day',RAIN.replace('ini_month(1)','ini_month(2) ini_day(30)'),198),
        ('missing_heat',TEMP.replace(' heat_threshold(30)',''),198),
        ('missing_glo',TEMP.replace(' gdd_lo(10)',''),198),
        ('missing_ghi',TEMP.replace(' gdd_hi(30)',''),198),
        ('gdd_order',TEMP.replace('gdd_hi(30)','gdd_hi(5)'),198),
        ('rain_temp_opt',RAIN+' heat_threshold(30)',198),
        ('temp_rain_opt',TEMP+' rain_threshold(1)',198),
        ('bin_conflict',TEMP+' tmp_bin(3) tmp_binlo(0) tmp_binhi(30) cuts(10)',198),
        ('bad_cut_order',RAIN+' cuts(2 1)',198),
        ('duplicate_cuts',RAIN+' cuts(1 1)',198),
        ('ref_conflict',RAIN+' baseline(2019 2020) lr_years(2)',198),
        ('ref_min',RAIN+' lr_years(2) ref_min(3)',198),
        ('minobs_zero',RAIN+' minobs(0)',198),
        ('negative_rain_threshold',RAIN+' rain_threshold(-1)',198),
        ('bad_keep',RAIN.replace('keep(id)','keep(absent)'),111),
        ('bad_shape',RAIN+' shape(square)',198),
        ('long_stub',RAIN+' outstub(abcdefghijklmnopqrstuvwxyz12345_)',198),
        ('gdd_inexact_range',TEMP+' gdd_bin(3) gdd_binlo(0) gdd_binhi(10)',198),
        ('gdd_too_many_categories',TEMP.replace('gdd_lo(10)','gdd_lo(0)')+' gdd_bin(.01)',198),
        ('bin_too_many',TEMP+' tmp_bin(43) tmp_binlo(0) tmp_binhi(30)',198),
    ]:
        case('reject_'+name,base+'datasignature\nlocal before `r(datasignature)\'\ncapture '+cmd+f'\nassert _rc=={rc}\ndatasignature\nassert "`before\'"=="`r(datasignature)\'"\n','validation')
    # Missing threshold values are not real thresholds; require a clean error and rollback.
    for opt,cmd in [('rain_threshold',RAIN),('gdd_lo',TEMP),('gdd_hi',TEMP),('heat_threshold',TEMP),('kdd_base',TEMP),('tmp_binlo',TEMP+' tmp_bin(3) tmp_binlo(0) tmp_binhi(30)')]:
        import re
        new=re.sub(r'\b'+opt+r'\([^)]*\)',opt+'(.)',cmd) if opt+'(' in cmd else cmd+' '+opt+'(.)'
        case('reject_missing_'+opt,base+'datasignature\nlocal before `r(datasignature)\'\ncapture '+new+'\nassert _rc==198\ndatasignature\nassert "`before\'"=="`r(datasignature)\'"\n','validation')
    case('name_clash_rollback',base+'gen total_2020=77\ndatasignature\nlocal before `r(datasignature)\'\ncapture '+RAIN.replace('keep(id)','shape(wide)')+'\nassert _rc==110\ndatasignature\nassert "`before\'"=="`r(datasignature)\'"\n')
    case('year_clash',base+'gen year=2020\ncapture '+RAIN.replace('keep(id)','keep(id year)')+'\nassert _rc==198\n')
    case('gdd_categories_edges',wide([[10,10,10,10,10,10],[20,10,10,10,10,10],[30,10,10,10,10,10],[40,40,40,40,40,40],[None]*6])+TEMP+' gdd_bin(10) gdd_binlo(10) gdd_binhi(30)\nassert gddcat==1 if id==1\nassert gddcat==2 if id==2\nassert gddcat==3 if id==3\nassert gddcat==4 if id==4\nassert missing(gddcat) if id==5\nlocal lab : value label gddcat\nassert "`lab\'"=="gddcat"\n')
    case('save_success_and_overwrite',base+'tempfile out\n'+RAIN+' save("`out\'")\nconfirm file "`out\'"\nuse "`out\'", clear\nassert total==6 if id==1\n'+base+'datasignature\nlocal before `r(datasignature)\'\ncapture '+RAIN+' save("`out\'")\nassert _rc==602\ndatasignature\nassert "`before\'"=="`r(datasignature)\'"\n'+RAIN+' save("`out\'", replace)\n')

def make_prep():
    long='clear\ninput str2 id double day double v\n"b" 20200103 3\n"a" 20200101 1\n"a" 20200103 .\n"b" 20200101 2\nend\n'
    for nofill in ['', ' nofill']:
        case('prep_fill' if not nofill else 'prep_nofill',long+'wxprep towide v, id(id) date(day) stub(x_) clear'+nofill+'\nassert _N==2\nassert r(n_days)=='+('3' if not nofill else '2')+'\nassert r(n_filled)=='+('1' if not nofill else '0')+'\nassert x_20200101==1 if id=="a"\nassert missing(x_20200103) if id=="a"\nassert x_20200103==3 if id=="b"\n'+('assert missing(x_20200102)\n' if not nofill else 'capture confirm variable x_20200102\nassert _rc==111\n'))
    for fmt,gen,opt in [('daily','gen long d=mdy(1,1,2020)+_n-1\nformat d %td',''),('datetime','gen double d=clock("01jan2020 01:00:00","DMYhms")+(_n-1)*86400000\nformat d %tc',''),('leap_datetime','gen double d=cofC(clock("01jan2020 01:00:00","DMYhms"))+(_n-1)*86400000\nformat d %tC',''),('integer','gen long d=20200100+_n',''),('string','gen str10 d="2020-01-0"+string(_n)','dateformat(YMD)')]:
        case('prep_date_'+fmt,'clear\nset obs 3\ngen id=1\ngen double v=_n\n'+gen+'\nwxprep towide v, id(id) date(d) stub(x_) clear '+opt+'\nassert x_20200101==1 & x_20200102==2 & x_20200103==3\n')
    dup='clear\ninput id long d double v\n1 20200101 2\n1 20200101 6\n1 20200102 .\n1 20200102 .\n2 20200101 7\nend\n'
    for method,expected in [('mean',4),('sum',8),('min',2),('max',6)]:
        case('prep_daily_'+method,dup+f'wxprep towide v, id(id) date(d) stub(x_) clear daily({method})\nassert r(n_combined)==2\nassert x_20200101=={expected} if id==1\nassert missing(x_20200102)\nassert x_20200101==7 if id==2\n')
    for name,data,cmd,rc in [
        ('duplicate',dup,'wxprep towide v, id(id) date(d) stub(x_) clear',459),
        ('changed',long,'wxprep towide v, id(id) date(day) stub(x_)',4),
        ('missing_id',long+'replace id="" in 1\n','wxprep towide v, id(id) date(day) stub(x_) clear',416),
        ('invalid_date',long+'replace day=20200230 in 1\n','wxprep towide v, id(id) date(day) stub(x_) clear',416),
        ('bad_stub',long,'wxprep towide v, id(id) date(day) stub(2bad) clear',198),
        ('value_in_id',long,'wxprep towide v, id(id v) date(day) stub(x_) clear',198),
        ('empty_selection',long,'wxprep towide v if v>100 & v<., id(id) date(day) stub(x_) clear',2000),
    ]:
        case('prep_reject_'+name,data+'datasignature\nlocal before `r(datasignature)\'\ncapture '+cmd+f'\nassert _rc=={rc}\ndatasignature\nassert "`before\'"=="`r(datasignature)\'"\n','validation')
    case('prep_if_in',long+'wxprep towide v if id=="b" in 1/3, id(id) date(day) stub(x_) clear\nassert _N==1 & id=="b" & x_20200103==3\nassert r(n_days)==1\n')
    case('prep_date_also_value',long+'wxprep towide day, id(id) date(day) stub(x_) clear\nassert x_20200101==20200101 & x_20200103==20200103\n')
    case('prep_roundtrip_exact',wide([[1.123456789012,16777217,None,3.25,1e12,-1e12],[2,None,4,5,6,7]])+'replace x_20200103=.a in 1\ngen str2 tag=cond(id==1,"aa","bb")\ntempfile orig\nsave "`orig\'"\nwxprep tolong x_, id(id tag) generate(v) date(d) clear\nassert r(n_days)==6 & r(n_units)==2 & _N==12\nwxprep towide v, id(id tag) date(d) stub(x_) clear\nsort id\ncf _all using "`orig\'", all\n')
    case('prep_single_day_roundtrip',wide([[17],[None]])+'wxprep tolong x_, id(id) clear\nassert _N==2 & date==mdy(1,1,2020)\nassert x==17 if id==1\nwxprep towide x, id(id) date(date) stub(x_) clear\nassert _N==2 & x_20200101==17 if id==1\n')
    case('prep_multi_id',long+'gen int region=1\nwxprep towide v, id(region id) date(day) stub(x_) clear\nassert _N==2 & region==1\n')
    case('prep_rename_consecutive',wide([[1,2,3]],'20200228')+'rename (x_20200228 x_20200229 x_20200301) (a b c)\nwxprep rename a b c, stub(r_) firstdate(28feb2020)\nassert r(n_vars)==3 & r(n_gaps)==0\nassert r_20200228==1 & r_20200229==2 & r_20200301==3\n')
    case('prep_rename_parsed_gap','clear\nset obs 1\ngen old_03jan2020=3\ngen old_01jan2020=1\nwxprep rename old_*, stub(r_) from(old_) dateformat(DMY)\nassert r(n_gaps)==1\nassert r_20200101==1 & r_20200103==3\n')
    for name,extra,cmd,rc in [('clash','gen r_20200101=4','wxprep rename x_*, stub(r_) firstdate(01jan2020)',110),('invalid','','wxprep rename x_*, stub(r_) firstdate(30feb2020)',198),('duplicate','rename (x_20200101 x_20200102) (a_1jan2020 a_01jan2020)','wxprep rename a_*, stub(r_) from(a_) dateformat(DMY)',198)]:
        case('prep_rename_reject_'+name,wide([[1,2]])+extra+'\ndatasignature\nlocal before `r(datasignature)\'\ncapture '+cmd+f'\nassert _rc=={rc}\ndatasignature\nassert "`before\'"=="`r(datasignature)\'"\n')
    case('prep_tolong_duplicate_id',wide([[1,2],[3,4]])+'replace id=1\ncapture wxprep tolong x_, id(id) clear\nassert _rc==459\n')
    case('prep_tolong_name_conflict',wide([[1,2]])+'capture wxprep tolong x_, id(id) generate(id) clear\nassert _rc==198\n')

def make_oracles(run):
    rng=random.Random(20261015)
    dates=[]
    for y in range(2000,2006):
        dates += [dt.date(y,1,d) for d in range(1,13)]
        dates += [dt.date(y,2,28),dt.date(y,3,1),dt.date(y,3,2)]
        if y%4==0: dates.append(dt.date(y,2,29))
        dates += [dt.date(y,12,d) for d in [29,30,31]]
    dates=sorted(dates)
    for typ in ['rain','temp']:
        series=[]
        choices=[0,.2,.9,1,2,5,17] if typ=='rain' else [-10,0,10,20,29.5,30,32,40]
        for i in range(12):
            a={d:(None if rng.random()<.18 or (i==0 and d.year==2001) else rng.choice(choices)) for d in dates}
            if i==1: a={d:2 if typ=='rain' else 35 for d in dates}
            if i==2: a={d:None for d in dates}
            series.append(a)
        fixture=run/('oracle_'+typ+'.csv')
        with fixture.open('w',newline='') as f:
            w=csv.writer(f);w.writerow(['id']+['x_'+d.strftime('%Y%m%d') for d in dates])
            for i,a in enumerate(series,1): w.writerow([i]+['' if a[d] is None else a[d] for d in dates])
        load='import delimited using '+q(fixture)+', clear varnames(1) asdouble\n'
        opts='type(rain)' if typ=='rain' else 'type(temp) gdd_lo(10) gdd_hi(30) heat_threshold(30) kdd_base(32)'
        edges=(1,2,5) if typ=='rain' else (10,30,32)
        cuts=' cuts('+' '.join(map(str,edges))+')'
        for window,sm,sd,em,ed,cross in [('january',1,1,1,12,0),('cross_year',12,29,3,2,1),('leap_day',2,29,2,29,0)]:
            for refmode in ['rolling','baseline']:
                for shape in ['long','wide']:
                    wins={}
                    for y in range(2000,2006-cross):
                        s=dt.date(y,sm,min(sd,28) if sm==2 and y%4 else sd)
                        e=dt.date(y+cross,em,min(ed,28) if em==2 and (y+cross)%4 else ed)
                        wins[y]=(s,e)
                    refopt='lr_years(2)' if refmode=='rolling' else 'baseline(2000 2002)'
                    text=load+f'wxsum x_, {opts} ini_month({sm}) ini_day({sd}) fin_month({em}) fin_day({ed}) {refopt} ref_min(2) minobs(2) shape({shape}) keep(id)'+cuts+'\n'
                    stats={(i,y):core(a,s,e,typ,2,edges) for i,a in enumerate(series,1) for y,(s,e) in wins.items()}
                    for i in range(1,13):
                        for y in wins:
                            ryears=[ry for ry in wins if (y-2<=ry<y if refmode=='rolling' else 2000<=ry<=2002)]
                            result=dict(stats[i,y])
                            if len(ryears)>=2: result.update(reference(stats[i,y],[stats[i,ry] for ry in ryears],2,typ))
                            elif shape=='long':
                                # Long output has deviations if at least one window qualifies.
                                result.update(reference(stats[i,y],[],2,typ))
                            for k,v in result.items():
                                text+=eq(k if shape=='long' else f'{k}_{y}',v,f'id=={i}'+(f' & year=={y}' if shape=='long' else ''))
                    text+=f'assert _N=={12*len(wins) if shape=="long" else 12}\n'
                    case(f'oracle_{typ}_{window}_{refmode}_{shape}',text,'oracle')
        # Varying dates, including a >1 year interval, missing dates, and partial coverage.
        windows=[(dt.date(2004,1,1),dt.date(2004,1,12)),(dt.date(2004,12,29),dt.date(2005,3,2)),(dt.date(2004,2,29),dt.date(2004,3,2)),(dt.date(2003,1,1),dt.date(2004,1,12)),(dt.date(1999,12,29),dt.date(2000,1,12)),(dt.date(2005,12,29),dt.date(2006,1,3)),(None,None)]
        windows=(windows*2)[:12]
        def shift(d,y):
            try: return d.replace(year=y)
            except ValueError: return d.replace(year=y,day=28)
        for partial in [False,True]:
            for refmode in ['rolling','baseline']:
                text=load+'gen long s=.\ngen long e=.\n'
                for i,(s,e) in enumerate(windows,1):
                    if s: text+=f'replace s={(s-EPOCH).days} in {i}\nreplace e={(e-EPOCH).days} in {i}\n'
                text+='format s e %td\n'+f'wxsum x_, {opts} start(s) end(e) keep(id s e) minobs(2) ref_min(2) '+('partial ' if partial else '')+('lr_years(2)' if refmode=='rolling' else 'baseline(2000 2002)')+cuts+'\n'
                def calc(a,s,e):
                    if s is None or (not partial and (s<dates[0] or e>dates[-1])):
                        return dict.fromkeys(core({},dates[0],dates[0],typ,2,edges))
                    return core(a,s,e,typ,2,edges)
                for i,(a,(s,e)) in enumerate(zip(series,windows),1):
                    current=calc(a,s,e)
                    refs=[]
                    if s:
                        for y in (range(s.year-2,s.year) if refmode=='rolling' else range(2000,2003)):
                            refs.append(calc(a,shift(s,y),shift(e,y+e.year-s.year)))
                    result={**current,**reference(current,refs,2,typ)}
                    for k,v in result.items(): text+=eq(k,v,f'id=={i}')
                case(f'oracle_{typ}_unit_{refmode}_'+('partial' if partial else 'strict'),text,'oracle')
        # Same dates by event shortcut with lag, with both positive and negative lag.
        for lag in [-2,0,3]:
            event=dt.date(2004,1,10)
            s=event-dt.timedelta(days=5+lag); e=event-dt.timedelta(days=1+lag)
            text=load+f'gen long event={(event-EPOCH).days}\nwxsum x_, {opts} event_date(event) days(5) lag({lag}) keep(id event) lr_years(2)\n'
            for i,a in enumerate(series,1):
                current=core(a,s,e,typ)
                refs=[core(a,shift(s,y),shift(e,y+e.year-s.year),typ) for y in range(s.year-2,s.year)]
                for k,v in {**current,**reference(current,refs,2,typ)}.items(): text+=eq(k,v,f'id=={i}')
            case(f'oracle_{typ}_event_lag_{lag}',text,'oracle')

def make_failure_io(run):
    # A nonexistent parent is deterministic and causes save() itself to fail.
    bad=run/'does_not_exist'/'out.dta'
    base=wide([[1,2,3,4,5,6]])
    for name,setup,cmd in [('wxsum',base,RAIN),('prep_tolong',base,'wxprep tolong x_, id(id) clear'),('prep_towide','clear\ninput id long d v\n1 20200101 5\n1 20200102 6\nend\n','wxprep towide v, id(id) date(d) stub(x_) clear')]:
        case('save_failure_atomic_'+name,setup+'datasignature\nlocal before `r(datasignature)\'\ncapture '+cmd+' save('+q(bad)+', replace)\nlocal rc=_rc\nassert `rc\'!=0\ndatasignature\nassert "`before\'"=="`r(datasignature)\'"\n','io')

def make_extended(source, run):
    base=wide([[1,2,3,4,5,6]])
    case('documented_longest_heat_formula',wide([[35,None,35,35,20,20]])+TEMP+'\n* Help says max(heat_start,heat,heat_end) is the longest heat run.\n* The two consecutive 35s on days 3 and 4 are the longest run.\nassert max(heat_start,heat,heat_end)==2\n','documentation')
    case('prep_early_year_eight_digit_names','clear\nset obs 1\ngen id=1\ngen double d=mdy(1,1,999)\nassert !missing(d)\nformat d %td\ngen v=7\nwxprep towide v, id(id) date(d) stub(x_) clear\nconfirm variable x_09990101\nwxprep tolong x_, id(id) clear\nassert x==7 & date==mdy(1,1,999)\n')
    case('prep_rename_early_year','clear\nset obs 1\ngen a=7\nwxprep rename a, stub(x_) firstdate(09990101)\nconfirm variable x_09990101\n')
    case('default_ref_min_strict','clear\nset obs 1\ngen id=1\ngen x_20000101=10\ngen x_20010101=.\ngen x_20020101=30\ngen x_20030101=40\nwxsum x_, type(rain) ini_month(1) fin_month(1) fin_day(1) keep(id) lr_years(2)\nassert missing(dev_total)\n')
    case('relaxed_ref_min','clear\nset obs 1\ngen id=1\ngen x_20000101=10\ngen x_20010101=.\ngen x_20020101=30\ngen x_20030101=40\nwxsum x_, type(rain) ini_month(1) fin_month(1) fin_day(1) keep(id) lr_years(3) ref_min(2)\nassert dev_total==20 if year==2003\nassert abs(z_total-sqrt(2))<1e-10 if year==2003\n')
    case('calendar_interior_year_no_daily_variables','clear\nset obs 1\ngen id=1\ngen x_20000101=10\ngen x_20020101=30\nwxsum x_, type(rain) ini_month(1) fin_month(1) fin_day(1) keep(id)\nassert _N==3\nassert nobs==0 & missing(total) if year==2001\n')
    for y,expected in [(2019,28),(2020,29)]:
        vals=[[1]*(expected)]
        case('february_last_day_'+str(y),wide(vals,f'{y}0201')+f'wxsum x_, type(rain) ini_month(2) fin_month(2) keep(id)\nassert nobs=={expected} & total=={expected}\n')
    for kind,extra in [('reversed','gen s=mdy(1,5,2020)\ngen e=s-1'),('fractional','gen double s=mdy(1,1,2020)+.5\ngen e=s+1'),('datetime','gen double s=clock("01jan2020 00:00:00","DMYhms")\ngen double e=s+86400000\nformat s e %tc')]:
        case('unit_reject_'+kind,base+extra+'\ndatasignature\nlocal before `r(datasignature)\'\ncapture wxsum x_, type(rain) start(s) end(e) keep(id)\nassert _rc==198\ndatasignature\nassert "`before\'"=="`r(datasignature)\'"\n','validation')
    # Check variable-capacity rejection inside the command, after successfully loading data.
    case('maxvar_wxsum',base+'local target=c(maxvar)-12\nforvalues j=1/`target\' {\n quietly gen byte z`j\'=0\n}\ndatasignature\nlocal before `r(datasignature)\'\ncapture '+RAIN.replace('keep(id)','shape(wide)')+'\nassert _rc==900\ndatasignature\nassert "`before\'"=="`r(datasignature)\'"\n','capacity')
    case('maxvar_wxprep','clear\nset obs 2\ngen id=1\ngen long d=mdy(1,1,1960)+(_n-1)*20001\nformat d %td\ngen v=1\ndatasignature\nlocal before `r(datasignature)\'\ncapture wxprep towide v, id(id) date(d) stub(x_) clear\nassert _rc==900\ndatasignature\nassert "`before\'"=="`r(datasignature)\'"\n','capacity')
    case('kelvin_transform_roundtrip',wide([[273.15,283.15,303.15,313.15,None,None]])+'wxprep tolong x_, id(id) generate(kelvin) clear\ngen double celsius=kelvin-273.15\nwxprep towide celsius, id(id) date(date) stub(c_) clear\nwxsum c_, type(temp) ini_month(1) fin_month(1) fin_day(6) gdd_lo(10) gdd_hi(30) heat_threshold(30) keep(id)\nassert abs(gdd-40)<1e-9 & abs(kdd-10)<1e-9 & heatdays==2 & nobs==4\n','integration')
    case('merge_and_analysis',wide([[0,1,2,3,4,5],[1,2,3,4,5,6],[2,3,4,5,6,7],[3,4,5,6,7,8],[4,5,6,7,8,9],[5,6,7,8,9,10]])+RAIN+'\ntempfile stats\nsave "`stats\'"\nclear\nset obs 6\ngen id=_n\ngen year=2020\ngen double outcome=5+18*id\nmerge 1:1 id year using "`stats\'"\nassert _merge==3\nregress outcome total\nassert abs(_b[total]-3)<1e-9 & e(N)==6\n','integration')
    # CSV files are inspected directly with Python's CSV reader. The DTA command
    # results are checked against independently computed CSV expectations.
    for typ,stub in [('rain','rf_'),('temp','tmp_')]:
        with (source/(typ+'.csv')).open(newline='',encoding='utf-8-sig') as f:
            reader=csv.DictReader(f); raw=list(reader);fields=reader.fieldnames
        datecols={c:dt.datetime.strptime(c[-8:],'%Y%m%d').date() for c in fields if c.startswith(stub) and len(c)==len(stub)+8}
        units={}
        for row in raw:
            row={key.strip():value for key,value in row.items()}
            # Bundled CSV uses a row identifier; DTA may be a different subset.
            ident=row.get('hhid',row.get('id',''))
            if not ident or not 101<=float(ident)<=110: continue
            def daily_value(value):
                if value.strip() in ['', '.', 'NA','NaN']: return None
                x=float(value)
                # DTA temperature values are float32; CSV decimal text is not
                # exact binary32. Match the *input* precision before the oracle.
                return struct.unpack('f',struct.pack('f',x))[0] if typ=='temp' else x
            units[float(ident)]={d:daily_value(row[c.strip()]) for c,d in datecols.items()}
        opts='type(rain)' if typ=='rain' else 'type(temp) gdd_lo(10) gdd_hi(30) heat_threshold(30) kdd_base(32)'
        text='use '+q(source/(typ+'.dta'))+', clear\n'+f'wxsum {stub}, {opts} ini_month(5) ini_day(15) fin_month(10) fin_day(15) keep(hhid)\nassert _N>0\nisid hhid year\nassert nobs>=0 & nobs<=154\n'
        # Only add numerical CSV comparisons if this CSV has matching hhid keys;
        # otherwise smoke execution is distinct from a numerical equivalence test.
        for ident,a in units.items():
            for y in sorted({d.year for d in a if d.year>=2003}):
                s,e=dt.date(y,5,15),dt.date(y,10,15)
                if s<min(a) or e>max(a): continue
                for k,v in core(a,s,e,typ).items(): text+=eq(k,v,f'hhid=={ident} & year=={y}')
        case('bundled_'+typ+'_csv_oracle',text,'bundled')
        for full in [False,True]:
            file=source/(typ+('_full' if full else '')+'.dta')
            text='use '+q(file)+', clear\nassert _N>0\n'+f'timer clear 1\ntimer on 1\nwxsum {stub}, {opts} ini_month(11) fin_month(2) keep(hhid)\ntimer off 1\ntimer list 1\nisid hhid year\nassert nobs>=0 & nobs<=121\n'
            case('bundled_'+typ+('_full' if full else '_sample')+'_cross_year',text,'bundled')
        for rows in [1000,10000]:
            text=wide([[1]*6])+f'expand {rows}\nreplace id=_n\ntimer clear 1\ntimer on 1\n'+(RAIN if typ=='rain' else TEMP)+'\ntimer off 1\ntimer list 1\nassert _N=='+str(rows)+'\nassert nobs==6\n'
            case(f'performance_{typ}_{rows}',text,'performance')
    for mode in ['calendar','unit']:
        text=wide([[1]*366])+ 'expand 12000\nreplace id=_n\n'
        if mode=='calendar':
            cmd='wxsum x_, type(rain) ini_month(1) fin_month(12) keep(id)'
        else:
            text+='gen long s=mdy(1,1,2020)\ngen long e=mdy(12,31,2020)\n'
            cmd='wxsum x_, type(rain) start(s) end(e) keep(id)'
        text+='timer clear 1\ntimer on 1\n'+cmd+'\ntimer off 1\ntimer list 1\nassert _N==12000 & nobs==366 & total==366 & mean==1 & var==0\n'
        case('chunk_boundary_'+mode+'_12000x366',text,'performance')
    import re
    body=(source/'sj paper'/'wxsum_body.tex').read_text(encoding='utf-8')
    for n,block in enumerate(re.findall(r'\\begin\{stlog\}(.*?)\\end\{stlog\}',body,re.S),1):
        commands=[]
        for line in block.splitlines():
            line=line.strip()
            if line.startswith(('. ','> ')): commands.append(line[2:])
        if not any(c.startswith('wxsum ') for c in commands): continue
        commands=[re.sub(r'^use (\w+\.dta)',lambda m:'use '+q(source/m[1]),c) for c in commands]
        commands=[re.sub(r'save\([^)]*\)', 'save("`paper_save\'")',c) for c in commands]
        case('manuscript_example_'+str(n),'tempfile paper_save\n'+'\n'.join(commands)+'\n','documentation')

def inventory(source, run):
    result=[]
    for p in sorted(source.rglob('*')):
        if not p.is_file(): continue
        data=p.read_bytes()
        row=dict(path=p.relative_to(source).as_posix(),bytes=len(data),sha256=hashlib.sha256(data).hexdigest())
        if p.suffix.lower() not in ['.dta','.pdf']:
            txt=data.decode('utf-8-sig',errors='replace'); row['lines']=len(txt.splitlines())
        result.append(row)
    (run/'source_inventory.json').write_text(json.dumps(result,indent=2),encoding='utf-8')
    return result

def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--source',required=True,type=Path)
    p.add_argument('--stata',required=True,type=Path)
    p.add_argument('--results',type=Path,default=HERE/'verified_results')
    args=p.parse_args()
    source=args.source.resolve(); run=args.results.resolve()
    run.mkdir(parents=True,exist_ok=True); (run/'cases').mkdir(exist_ok=True)
    if not (source/'wxsum.ado').is_file() or not (source/'wxprep.ado').is_file(): p.error('source must contain both ado files')
    inv=inventory(source,run)
    make_behavior();make_prep();make_oracles(run);make_failure_io(run);make_extended(source,run)
    rows=[]
    # This is a separate packaging test, without network or a remote installation.
    for line in (source/'wxsum.pkg').read_text().splitlines():
        if line.startswith(('f ','F ')):
            target=line[2:].strip()
            rows.append(dict(name='package_file:'+target,group='packaging',status='PASS' if (source/target).is_file() else 'FAIL',rc=0 if (source/target).is_file() else 601))
    for target in ['examples/wxsum_examples.do','examples/wxsum_examples.log']:
        rows.append(dict(name='documented_file:'+target,group='packaging',status='PASS' if (source/target).is_file() else 'FAIL',rc=0 if (source/target).is_file() else 601))
    with (run/'static_results.json').open('w') as f: json.dump(rows,f,indent=2)
    for n,c in enumerate(CASES):
        c['path']=run/'cases'/f'{n+1:03}_{c["name"]}.do'
        c['path'].write_text('version 15.1\nset type double\n'+c['body'],encoding='utf-8')
    result_csv=run/'stata_results.csv'
    script=['clear all','set more off','set maxvar 20000','set type double', 'set seed 20261015', 'adopath ++ '+q(source),'capture log close _all','log using '+q(run/'stata_full.log')+', text replace','file open results using '+q(result_csv)+', write text replace','file write results "name,group,status,rc" _n']
    for c in CASES:
        script += ['display "AUDIT_CASE_BEGIN '+c['name']+'"','capture noisily do '+q(c['path']),'local rc = _rc','local status = cond(`rc\'==0,"PASS","FAIL")','file write results "'+c['name']+','+c['group']+',`status\',`rc\'" _n','global WXSUM_TEST_FAIL','display "AUDIT_CASE_END '+c['name']+' rc=" `rc\'']
    script += ['file close results','display "AUDIT_FINISHED"','log close','exit, clear']
    master=run/'run_all.do';master.write_text('\n'.join(script)+'\n',encoding='utf-8')
    t=time.time()
    command=[str(args.stata.resolve()),'/e','do',str(master)]
    # CREATE_NO_WINDOW prevents a visible background helper window on Windows.
    proc=subprocess.Popen(command,cwd=run,creationflags=0x08000000 if sys.platform=='win32' else 0)
    try: proc.wait(timeout=900)
    except subprocess.TimeoutExpired:
        proc.kill(); raise RuntimeError('Stata exceeded 15 minutes; partial logs retained')
    if not result_csv.is_file(): raise RuntimeError('Stata produced no results; check license and '+str(run/'run_all.log'))
    with result_csv.open(newline='') as f: rows += list(csv.DictReader(f))
    executed=len(rows)-len(json.loads((run/'static_results.json').read_text()))
    complete=executed==len(CASES) and 'AUDIT_FINISHED' in (run/'stata_full.log').read_text(errors='replace')
    summary=dict(source=str(source),stata=str(args.stata),generated_at=dt.datetime.now(dt.timezone.utc).isoformat(),elapsed_seconds=round(time.time()-t,2),complete=complete,stata_cases=executed,expected_stata_cases=len(CASES),passed=sum(r['status']=='PASS' for r in rows),failed=sum(r['status']=='FAIL' for r in rows),results=rows)
    (run/'results.json').write_text(json.dumps(summary,indent=2),encoding='utf-8')
    with (run/'results.csv').open('w',newline='') as f:
        w=csv.DictWriter(f,fieldnames=['name','group','status','rc']);w.writeheader();w.writerows(rows)
    changed=[r['path'] for r in inv if hashlib.sha256((source/r['path']).read_bytes()).hexdigest()!=r['sha256']]
    summary['source_changed']=changed
    (run/'results.json').write_text(json.dumps(summary,indent=2),encoding='utf-8')
    print(json.dumps({k:v for k,v in summary.items() if k!='results'},indent=2))
    print('FAILED: '+'; '.join(r['name'] for r in rows if r['status']=='FAIL'))
    return 1 if summary['failed'] or not complete or changed else 0

if __name__=='__main__': sys.exit(main())
