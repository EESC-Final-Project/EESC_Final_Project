%addpath ('/Users/gracegjerde/Desktop/Final Project Data/All NO2 Data/');
%addpath ('/Users/gracegjerde/Desktop/Final Project Data/All PM 2.5 Data/')

addpath(genpath('/Users/yoderma/Documents/a_icloud.nosync/GitHub accessory files'))

% figure(1); clf
% worldmap('World')
% load coastlines
% plotm(coastlat,coastlon)
% scatterm(pm{1, 12}.lat,pm{1, 12}.lon,50,pm{1, 12}.mean,'filled')
% title('Daily Mean Value of PM 2.5 in 2012')
% colorbar
% caxis ([0 30])
%% Loading Data
%PM 2.5
PM_data = readtable('daily_88101_2012.csv');
PM_dataarraylat_lon = table2array(PM_data(:,6:7));
PM_dataarray_mean = table2array(PM_data(:,17));

% for i=12:13
%     filename = "daily_88101_20"+i+".csv";
%     PM_data = readtable(filename);
%     pm{i}.lat = PM_data.Latitude;
%     pm{i}.lon = PM_data.Longitude;
%     pm{i}.mean = PM_data.ArithmeticMean;
%     pm{i}.max = PM_data.x1stMaxValue;
%     pm{i}.maxhr = PM_data.x1stMaxHour;
%     pm{i}.aqi = PM_data.AQI
%     pm{i}.time = PM_data.DateLocal;
% end

lat = unique(PM_dataarraylat_lon(:,1));
lon = unique(PM_dataarraylat_lon(:,2));

%indexing for specific months
time = datevec(PM_data.DateLocal);
ind = find (time(:,2)==1);
singlemonth = PM_data.DateLocal (ind);
monthavg = pm{i}.mean(ind);


for j = 1:length(lat)
    locations{j}.ind = find(PM_dataarraylat_lon(:,1) == lat(j,:)); %index of each station
    locations{j}.am = PM_dataarray_mean(locations{j}.ind,:); %arithmetic mean at each station
    locations{j}.stationmean = mean(locations{j}.am); %mean of the AM at each station
    locations{j}.latlon = PM_dataarraylat_lon(locations{j}.ind,:);
    for i = 1:12
        locations{j}.monthind = find (time(locations{j}.ind,2)==i); %index of each month
        locations{j}.monthmean(i,1) = mean(locations{j}.am(locations{j}.monthind)); %mean at each month at each station
    end
end

%january
for i = 1:length(lat)
locations{i}.january = locations{1, i}.monthmean(1,1);
end

feb (i) = locations{1, i}.monthmean(2,1);
march(i) = locations{1, i}.monthmean(3,1);
april (i) = locations{1, i}.monthmean(4,1);
may (i) = locations{1, i}.monthmean(5,1);
june (i) = locations{1, i}.monthmean(6,1);
july (i) = locations{1, i}.monthmean(7,1);
august (i) = locations{1, i}.monthmean(8,1);
september (i) = locations{1, i}.monthmean(9,1);
october (i) = locations{1, i}.monthmean(10,1);
november (i) = locations{1, i}.monthmean(11,1);
december (i) = locations{1, i}.monthmean(12,1);


figure; clf
worldmap([17.7125 64.8457], [-159.3662 -64.7849])
load coastlines
plotm(coastlat,coastlon);
for j=1:length(lat);
 scatterm(locations{j}.latlon(1,1),locations{j}.latlon(1,2),50,locations{j}.january,'filled');
 hold on
end
title('Daily Mean Value of PM 2.5 in 2012')
colorbar
caxis ([0 30])



%%
%2012 scatter of daily mean value (µ/m^3)
figure; clf
worldmap([17.7125 64.8457], [-159.3662 -64.7849])
load coastlines
plotm(coastlat,coastlon)
scatterm(lat,lon,50,monthavg,'filled')
title('Daily Mean Value of PM 2.5 in 2012')
colorbar
caxis ([0 30])
%large outlier in Alaska 
%us cmocean to change colors
%%
figure; clf
worldmap([17.7125 64.8457], [-159.3662 -64.7849])
load coastlines
plotm(coastlat,coastlon)
scatterm(pm{1, 12}.lat,pm{1, 12}.lon,50,pm{1, 12}.max,'filled')
title('Daily Max Value of PM 2.5 in 2012')
colorbar
caxis ([0 30])

%%
figure; clf
worldmap([17.7125 64.8457], [-159.3662 -64.7849])
load coastlines
plotm(coastlat,coastlon)
scatterm(pm{1, 12}.lat,pm{1, 12}.lon,50,pm{1, 12}.aqi,'filled')
title('Daily AQI based on PM 2.5 in 2012')
colorbar
caxis ([0 100])

%NOx,NOy
