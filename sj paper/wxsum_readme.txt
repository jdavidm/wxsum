NOTE:  readme.txt template -- do not remove empty entries, but you may
                              add entries for additional authors
------------------------------------------------------------------------------

Package name:   <leave blank>

Title:  wxsum: A command for processing temperature and precipitation data

Author 1 name: Jeffrey D. Michler
Author 1 from: University of Arizona, Tucson, Arizona, USA
Author 1 email: jdmichler@arizona.edu

Author 2 name: Anna Josephson    
Author 2 from: University of Arizona, Tucson, Arizona, USA
Author 2 email: aljosephson@arizona.edu 

Author 3 name: Oscar Barriga-Cabanillas 
Author 3 from: World Bank, Washington, D.C., USA    
Author 3 email: obarriga@worldbank.org

Author 4 name: Aleksandr Michuda     
Author 4 from: Swarthmore College, Swarthmore, Pennsylvania, USA 
Author 4 email: amichud1@swarthmore.edu

Author 5 name:  Jeffrey C. Oliver
Author 5 from:  University of Arizona, Tucson, Arizona, USA
Author 5 email: jcoliver@arizona.edu

Help keywords: wxsum, wxprep, weather, rainfall, temperature

File list: wxsum.ado wxsum.sthlp wxprep.ado wxprep.sthlp wxsum_rain.dta wxsum_temp.dta
           examples/hh_panel.dta examples/births.dta examples/weather_hourly.dta
           examples/wxsum_examples.do examples/wxsum_examples.log
           examples/make_example_data.do

Notes: wxprep is a companion command that converts long daily data, or wide data with other variable names, to the layout wxsum needs. The datasets wxsum_rain.dta and wxsum_temp.dta, and the files in examples/, are included for testing and demonstration purposes only; hh_panel.dta, births.dta, and weather_hourly.dta are simulated (examples/make_example_data.do creates them from wxsum_rain.dta and wxsum_temp.dta). examples/wxsum_examples.do runs the examples in the article, and examples/wxsum_examples.log is its output. There are no additional user-written software packages required to run this command.