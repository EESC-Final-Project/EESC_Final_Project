% Add path
addpath ('/Users/gracegjerde/Desktop/Final Project Data/All NO2 Data/');
addpath ('/Users/gracegjerde/Desktop/Final Project Data/All PM 2.5 Data/')


% Loading Data PM 2.5
PM_data = readtable('daily_88101_2018.csv');
PM_dataarraylat_lon = table2array(PM_data(:,6:7));
PM_dataarray_mean = table2array(PM_data(:,17));
PM_dataarray_max = table2array(PM_data(:,18));
PM_dataarray_aqi = table2array(PM_data(:,20));

for i=18
    filename = "daily_88101_20"+i+".csv";
    PM_data = readtable(filename);
    pm{i}.lat = PM_data.Latitude;
    pm{i}.lon = PM_data.Longitude;
    pm{i}.mean = PM_data.ArithmeticMean;
    pm{i}.max = PM_data.x1stMaxValue;
    pm{i}.maxhr = PM_data.x1stMaxHour;
    pm{i}.aqi = PM_data.AQI
    pm{i}.time = PM_data.DateLocal;
end

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
    locations{j}.max = PM_dataarray_max(locations{j}.ind,:); %max at each station
    locations{j}.aqi = PM_dataarray_aqi(locations{j}.ind,:);
%     locations{j}.stationmean = mean(locations{j}.am); %mean of the AM at each station
%     locations{j}.stationmean = mean(locations{j}.am); %mean of the max at each station
    locations{j}.latlon = PM_dataarraylat_lon(locations{j}.ind,:);
    for i = 1:12
        locations{j}.monthind = find (time(locations{j}.ind,2)==i); %index of each month
        locations{j}.monthmean(i,1) = mean(locations{j}.am(locations{j}.monthind)); %mean at each month at each station
        locations{j}.monthmax(i,1) = mean(locations{j}.max(locations{j}.monthind));%mean monthly max at each station
        locations{j}.monthaqi(i,1) = mean(locations{j}.aqi(locations{j}.monthind));
        locations{j}.monthaqistd(i,1) = std(locations{j}.aqi(locations{j}.monthind));
        locations{j}.monthaqin(i,1) = numel(locations{j}.aqi(locations{j}.monthind));
    end
end

% t- test
%july to january
% july (mean:22.09 ,std:12.28 ,n:33)
% january (mean:58.22, std: 20.5189, n:27)
% (mean1 - mean2)/[sqrt(std1^2/n1) + (std2^2/n2)]
p = (58.22-22.09)/sqrt((12.28^2/33)+(20.2189^2/27)) %p = 8.13

%january
for i = 1:length(lat)
locations{i}.january = locations{1, i}.monthaqi(1,1);
locations{i}.july = locations{1, i}.monthaqi(7,1);
end
%%
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


figure; 
worldmap([17.7125 64.8457], [-159.3662 -64.7849])
load coastlines
plotm(coastlat,coastlon);
for j=1:length(lat);
 scatterm(locations{j}.latlon(1,1),locations{j}.latlon(1,2),50,locations{j}.june,'filled');
 hold on
end
title('Daily Mean AQI in 2018')
colorbar
%ylabel (colorbar,'µg/m^3')
%cmocean ('turbid')
cmocean ('amp')
caxis ([0 50])

figure; 
worldmap([17.7125 64.8457], [-159.3662 -64.7849])
load coastlines
plotm(coastlat,coastlon);
for j=1:length(lat);
 scatterm(locations{j}.latlon(1,1),locations{j}.latlon(1,2),50,locations{j}.june,'filled');
 hold on
end
title('Daily Max Value of PM 2.5 in June 2018')
colorbar
ylabel (colorbar,'µg/m^3')
cmocean ('turbid')
caxis ([0 30])

%use cmocean to change colors, fix figure code to do max value and aqi
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
