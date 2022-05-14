% Add path
addpath ('/Users/gracegjerde/Desktop/Final Project Data/All NO2 Data/');
addpath ('/Users/gracegjerde/Desktop/Final Project Data/All PM 2.5 Data/')
%%
% Loading Data
PM_data = readtable('daily_88101_2013.csv');
PM_dataarraylat_lon = table2array(PM_data(:,6:7));
PM_dataarray_mean = table2array(PM_data(:,17));
PM_dataarray_max = table2array(PM_data(:,18));
PM_dataarray_aqi = table2array(PM_data(:,20));

%% scatter spatial AQI 2013
%putting data into structure (can change i anywhere from i=12:21) 
%would change i to 13 and i to 18 to make the graphs for different years
for i=13
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
%   locations{j}.stationmean = mean(locations{j}.am); %mean of the AM at each station
%   locations{j}.stationmean = mean(locations{j}.am); %mean of the max at each station
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


%january and july 
for i = 1:length(lat)
locations{i}.january = locations{1, i}.monthaqi(1,1);
locations{i}.july = locations{1, i}.monthaqi(7,1);
end

%scatter for AQI 2013...changed values for Jan, July & 2013,2018

%january 2013
figure(1); 
worldmap([17.7125 64.8457], [-159.3662 -64.7849])
load coastlines
plotm(coastlat,coastlon);
for j=1:length(lat);
 scatterm(locations{j}.latlon(1,1),locations{j}.latlon(1,2),50,locations{j}.january,'filled');
 hold on
end
title('Average Monthly AQI in January 2013')
colorbar
cmocean ('amp')
caxis ([0 50])

%july 2013
figure(2); 
worldmap([17.7125 64.8457], [-159.3662 -64.7849])
load coastlines
plotm(coastlat,coastlon);
for j=1:length(lat);
 scatterm(locations{j}.latlon(1,1),locations{j}.latlon(1,2),50,locations{j}.july,'filled');
 hold on
end
title('Average Monthly AQI in July 2013')
colorbar
cmocean ('amp')
caxis ([0 50])
%% scatter spatial AQI 2018
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
%   locations{j}.stationmean = mean(locations{j}.am); %mean of the AM at each station
%   locations{j}.stationmean = mean(locations{j}.am); %mean of the max at each station
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


%january and july 
for i = 1:length(lat)
locations{i}.january = locations{1, i}.monthaqi(1,1);
locations{i}.july = locations{1, i}.monthaqi(7,1);
end

%scatter plot for AQI January 2018
figure(3); 
worldmap([17.7125 64.8457], [-159.3662 -64.7849])
load coastlines
plotm(coastlat,coastlon);
for j=1:length(lat);
 scatterm(locations{j}.latlon(1,1),locations{j}.latlon(1,2),50,locations{j}.january,'filled');
 hold on
end
title('Average Monthly AQI in January 2018')
colorbar
cmocean ('amp')
caxis ([0 50])

%AQI July 2018 plot
figure(4); 
worldmap([17.7125 64.8457], [-159.3662 -64.7849])
load coastlines
plotm(coastlat,coastlon);
for j=1:length(lat);
 scatterm(locations{j}.latlon(1,1),locations{j}.latlon(1,2),50,locations{j}.july,'filled');
 hold on
end
title('Average Monthly AQI in July 2018')
colorbar
cmocean ('amp')
caxis ([0 50])


%% scatter spatial PM2.5 2013
PM_data = readtable('daily_88101_2013.csv');
PM_dataarraylat_lon = table2array(PM_data(:,6:7));
PM_dataarray_mean = table2array(PM_data(:,17));
PM_dataarray_max = table2array(PM_data(:,18));
PM_dataarray_aqi = table2array(PM_data(:,20));

for i=13
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
%   locations{j}.stationmean = mean(locations{j}.am); %mean of the AM at each station
    locations{j}.stationmean = mean(locations{j}.max); %mean of the max at each station
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


%january and july 
for i = 1:length(lat)
locations{i}.january = locations{1, i}.monthmax(1,1);
locations{i}.july = locations{1, i}.monthmax(7,1);
end


%scatter for PM2.5 2013 january
figure(5); 
worldmap([17.7125 64.8457], [-159.3662 -64.7849])
load coastlines
plotm(coastlat,coastlon);
for j=1:length(lat);
 scatterm(locations{j}.latlon(1,1),locations{j}.latlon(1,2),50,locations{j}.january,'filled');
 hold on
end
title('Average Max Value of PM 2.5 in January 2013')
colorbar
ylabel (colorbar,'µg/m^3')
cmocean ('turbid')
caxis ([0 30])


%scatter for PM2.5 2013 july
figure(6); 
worldmap([17.7125 64.8457], [-159.3662 -64.7849])
load coastlines
plotm(coastlat,coastlon);
for j=1:length(lat);
 scatterm(locations{j}.latlon(1,1),locations{j}.latlon(1,2),50,locations{j}.july,'filled');
 hold on
end
title('Average Max Value of PM 2.5 in July 2013')
colorbar
ylabel (colorbar,'µg/m^3')
cmocean ('turbid')
caxis ([0 30])
%% scatter spatial PM2.5 2018
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
%   locations{j}.stationmean = mean(locations{j}.am); %mean of the AM at each station
    locations{j}.stationmean = mean(locations{j}.max); %mean of the max at each station
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


%january and july 
for i = 1:length(lat)
locations{i}.january = locations{1, i}.monthmax(1,1);
locations{i}.july = locations{1, i}.monthmax(7,1);
end

%scatter for PM2.5 2018 january
figure (7); 
worldmap([17.7125 64.8457], [-159.3662 -64.7849])
load coastlines
plotm(coastlat,coastlon);
for j=1:length(lat);
 scatterm(locations{j}.latlon(1,1),locations{j}.latlon(1,2),50,locations{j}.january,'filled');
 hold on
end
title('Average Monthly Max Value of PM 2.5 in January 2018')
colorbar
ylabel (colorbar,'µg/m^3')
cmocean ('turbid')
caxis ([0 30])

%scatter for PM2.5 2018 july
figure (8); 
worldmap([17.7125 64.8457], [-159.3662 -64.7849])
load coastlines
plotm(coastlat,coastlon);
for j=1:length(lat);
 scatterm(locations{j}.latlon(1,1),locations{j}.latlon(1,2),50,locations{j}.july,'filled');
 hold on
end
title('Average Monthly Max Value of PM 2.5 in July 2018')
colorbar
ylabel (colorbar,'µg/m^3')
cmocean ('turbid')
caxis ([0 30])

%% t- test at AQI point in Alask (Fairbanks)
%july to january
% july (mean:22.09 ,std:12.28 ,n:33)
% january (mean:58.22, std: 20.5189, n:27)
% (mean1 - mean2)/[sqrt(std1^2/n1) + (std2^2/n2)]
p = (58.22-22.09)/sqrt((12.28^2/33)+(20.2189^2/27)) %p = 8.13

