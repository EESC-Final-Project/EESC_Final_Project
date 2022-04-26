addpath ('/Users/gracegjerde/Desktop/Final Project Data/All NO2 Data/');
addpath ('/Users/gracegjerde/Desktop/Final Project Data/All PM 2.5 Data/');
%% Loading Data
%PM 2.5
PM_data = readtable('daily_88101_2012.csv');

for i=12:13
    filename = "daily_88101_20"+i+".csv";
    PM_data = readtable(filename);
    pm{i}.lat = PM_data.Latitude;
    pm{i}.lon = PM_data.Longitude;
    pm{i}.mean = PM_data.ArithmeticMean;
    pm{i}.max = PM_data.x1stMaxValue;
    pm{i}.maxhr = PM_data.x1stMaxHour;
    pm{i}.aqi = PM_data.AQI;
end
%%
%2012 scatter of daily mean value (µ/m^3)
figure(1); clf
worldmap([17.7125 64.8457], [-159.3662 -64.7849])
load coastlines
plotm(coastlat,coastlon)
scatterm(pm{1, 12}.lat,pm{1, 12}.lon,50,pm{1, 12}.mean,'filled')
title('Daily Mean Value of PM 2.5 in 2012')
colorbar
caxis ([0 30])
%large outlier in Alaska
%us cmocean to change colors

figure(2); clf
worldmap([17.7125 64.8457], [-159.3662 -64.7849])
load coastlines
plotm(coastlat,coastlon)
scatterm(pm{1, 12}.lat,pm{1, 12}.lon,50,pm{1, 12}.max,'filled')
title('Daily Max Value of PM 2.5 in 2012')
colorbar
caxis ([0 30])

figure(3); clf
worldmap([17.7125 64.8457], [-159.3662 -64.7849])
load coastlines
plotm(coastlat,coastlon)
scatterm(pm{1, 12}.lat,pm{1, 12}.lon,50,pm{1, 12}.aqi,'filled')
title('Daily AQI based on PM 2.5 in 2012')
colorbar
caxis ([0 100])

%NOx,NOy
