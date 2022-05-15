# EESC_Final_Project
An Investigation of Air Quality Trends in the United States

(Grace Gjerde, Hannah McGowan, Kathleen Murphy, Alec Lawlor)

Data Used

EPA PM2.5 Concentrations Data: daily observations from 2012-2021 at an array of coordinate locations across the United States. 
URL: https://aqs.epa.gov/aqsweb/airdata/download_files.html#Meta

NOAA Humidity Data: .csv files consisting of meteorological observations at specific sensor locations and years. We chose sensor locations Fairbanks, Alaska and Durham, New Hampshire in years 2013 and 2018. 

URL: https://www.ncei.noaa.gov/access/crn/qcdatasets.html

(Daily Data): https://www.ncei.noaa.gov/pub/data/uscrn/products/daily01/


Link to Google Drive with pre-downloaded data: https://drive.google.com/drive/u/0/folders/1yXfZedmzCuvuSf6SfXbGpZkuW2kprRyt

Link to GitHub Repository: https://github.com/EESC-Final-Project/EESC_Final_Project.git


Notes about directory

Final_Code: contains running script

linfit - function for linear fit

cmocean - function for plotting

EVD_durhammean2_18 - saved variable of filled in means (interpolation), loaded in to plot the humidity and PM2.5 correlation

D_2018_DailyRH2 - saved variable of filled in relative humidity values (interpolation), loaded in to plot the humidity and PM2.5 correlation