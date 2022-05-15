% Complete code for Air Quality and Humidity Analysis
% Grace, Hannah, Alec and Kathleen 
%%
% Loading Data
PM_data = readtable('daily_88101_2013.csv');
PM_dataarraylat_lon = table2array(PM_data(:,6:7));
PM_dataarray_mean = table2array(PM_data(:,17));
PM_dataarray_max = table2array(PM_data(:,18));
PM_dataarray_aqi = table2array(PM_data(:,20));

%% Spatial Plots
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
%% Humidity Plots
%% Loading Data
%%addpath ('/Users/gracegjerde/Desktop/Final Project Data/');
%NOAA Fairbanks
Fairbanks_2013 = readtable('CRND0103-2013-AK_Fairbanks_11_NE.csv'); 
Fairbanks_2018 = readtable('CRND0103-2018-AK_Fairbanks_11_NE.csv');
%NOAA Durham
Durham_2013 = readtable('CRND0103-2013-NH_Durham_2_SSW.csv');
Durham_2018 = readtable('CRND0103-2018-NH_Durham_2_SSW.csv');
%% Defining Time Series Fairbanks Variable
F_2013_DailyRH = table2array(Fairbanks_2013(:,18));
F_2018_DailyRH = table2array(Fairbanks_2018(:,18));
%% Defining Time Series Durham Variable
D_2013_DailyRH = table2array(Durham_2013(:,18));
D_2018_DailyRH = table2array(Durham_2018(:,18));
%% Final Plots (Relative Humidity and PM2.5 in 2013)
%2013 Fairbanks
figure
subplot (2,2,1)
ind=find(F_2013_DailyRH >= -9998);
time = (1:365);
% figure (1)
smooth_RH_F_2013 = movmean(F_2013_DailyRH(ind),30);
RH_F_std_2013 = std(smooth_RH_F_2013);
%scatter (time(ind),F_2013_DailyRH(ind))
hold on
plot (time(ind),smooth_RH_F_2013,'-');
%errorbar(time(ind),smooth_RH_F_2013,RH_F_std_2013);
title ('Relative Daily Humidity at Fairbanks 2013','FontSize',15)
xlabel('Month','FontSize',15)
ylabel ('Daily Humidity (%)','FontSize',15)
%legend('Raw Humidity Data', '30 day moving mean')
datetick('x', 3 , 'keeplimits')
hold on

%subplot 2 (PM 2.5 Data)
pm25data_13 = readtable('daily_88101_2013.csv');

FB_site10_mean_13= pm25data_13.ArithmeticMean(4348:4459);
FB_site10_date_13=pm25data_13.DateLocal(4348:4459);
FB_site10_AQI_13= pm25data_13.AQI(4348:4459);

smooth_FBsite10_mean_2013= movmean(FB_site10_mean_13,10);

subplot (2,2,3)
hold on
plot(FB_site10_date_13, FB_site10_mean_13, '.')
plot(FB_site10_date_13, smooth_FBsite10_mean_2013)
xlabel('Time (month)','FontSize',15)
ylabel('PM 2.5 Concentrations (µg/m^3)','FontSize',15)
title('PM 2.5 Concentrations at Fairbanks, AK 2013','FontSize',15)
legend("Site 10 Data Points", "1 Month Moving Mean")

%2013 Durham
% Durham 2013 (PM 2.5, AQI, RH)
% figure (3)
subplot (2,2,2)
hold on
ind=find(D_2013_DailyRH >= -9998);
time = (1:365);
smooth_RH_D_2013 = movmean(D_2013_DailyRH(ind),30);
RH_D_std_2013 = std(smooth_RH_D_2013);
%scatter (time(ind),D_2013_DailyRH(ind))
hold on
plot (time(ind),smooth_RH_D_2013,'-');
title ('Relative Daily Humidity at Durham in 2013','FontSize',15)
xlabel('Month','FontSize',15)
ylabel ('Daily Humidity (%)','FontSize',15)
%legend('Fairbanks','Durham','FontSize',11)
datetick('x', 3 , 'keeplimits')

hold on
%subplot 2 (PM 2.5 Data)
durhammean_13= pm25data_13.ArithmeticMean(194130:194190);
durhamtime_13=pm25data_13.DateLocal(194130:194190);
durhamAQI_13= pm25data_13.AQI(194130:194190);

std_durham_mean_2013= movstd(durhammean_13,5)
smooth_durham_mean_2013= movmean(durhammean_13,5)


subplot (2,2,4)
hold on
plot(durhamtime_13, durhammean_13, '.')
plot(durhamtime_13,smooth_durham_mean_2013)
xlabel('Time (month)','FontSize',15)
ylabel('PM 2.5 Concentration (µg/m^3)','FontSize',15)
title('PM 2.5 Concentration at Durham, NH 2013','FontSize',15)
legend("Site 14 Data Points", "1 Month Moving Mean")


%% Final Plots (Relative Humidity and PM2.5 in 2018)
%2018 Fairbanks
% Fairbanks 2018
figure
subplot (2,2,1)
ind=find(F_2018_DailyRH >= -9998);
time = (1:365);
smooth_RH_F_2018 = movmean(F_2018_DailyRH(ind),30);
RH_F_std_2018 = std(smooth_RH_F_2018);
%scatter (time(ind),F_2018_DailyRH(ind))
hold on
plot (time(ind),smooth_RH_F_2018,'-');
title ('Relative Daily Humidity at Fairbanks in 2018','FontSize',15)
xlabel('Month','FontSize',15)
ylabel ('Daily Humidity (%)','FontSize',15)
%legend('Raw Humidity Data', '30 day moving mean')
datetick('x', 3 , 'keeplimits')

hold on
%subplot 2 (PM 2.5 Data)
pm25data_18 = readtable('daily_88101_2018.csv');

FB_site10_mean_18= pm25data_18.ArithmeticMean(5347:5428);
FB_site10_date_18=pm25data_18.DateLocal(5347:5428);
FB_site10_AQI_18= pm25data_18.AQI(5347:5428);

%fairbanks mean 2018
smooth_FBsite10_mean_2018= movmean(FB_site10_mean_18,5);

std_FBsite10_mean_2018= movstd(FB_site10_mean_18,5);


subplot (2,2,3)
hold on
plot(FB_site10_date_18, FB_site10_mean_18, '.')
plot(FB_site10_date_18, smooth_FBsite10_mean_2018)
xlabel('Time (month)','FontSize',15)
ylabel('PM 2.5 Concentration (µg/m^3)','FontSize',15)
title('PM 2.5 Concentration at Fairbanks, AK 2018','FontSize',15)
legend("Site 10 Data Points", "1 Month Moving Mean")

%2018 Durham
% Durham 2018 (PM 2.5, AQI, RH)
% figure
subplot (2,2,2)
ind=find(D_2018_DailyRH >= -9998);
definedtime = (1:365);
smooth_RH_D_2018 = movmean(D_2018_DailyRH(ind),30);
RH_D_std_2018 = std(smooth_RH_D_2018);
%scatter (time(ind),D_2018_DailyRH(ind))
hold on
plot (time(ind),smooth_RH_D_2018,'-');
title ('Relative Daily Humidity at Durham in 2018','FontSize',15)
xlabel('Month','FontSize',15)
ylabel ('Daily Humidity (%)','FontSize',15)
%legend('Fairbanks', 'Durham','FontSize',11)
datetick('x', 3 , 'keeplimits')
hold on

%subplot 2 (PM 2.5 Data)
%everyday
EVD_durhammean_18= pm25data_18.ArithmeticMean(290355:290708);
EVD_durhamtime_18=pm25data_18.DateLocal(290355:290708);
EVD_durhamAQI_18= pm25data_18.AQI(290355:290708);

%mean
EVD_smooth_durham_mean_2018= movmean(EVD_durhammean_18,30);


subplot (2,2,4)
hold on
plot(EVD_durhamtime_18, EVD_durhammean_18, '.')
plot(EVD_durhamtime_18,EVD_smooth_durham_mean_2018)
xlabel('Time (month)','FontSize',15)
ylabel('PM 2.5 Concentration (µg/m^3)','FontSize',15)
title('PM 2.5 Concentratin at Durham, NH 2018','FontSize',15)
legend("Site 14 Data Point","1 Month Moving Mean")

%% Correlation of PM2.5 vs. Humdity in Durham 2018
%correlation coefficent
%scatter graph of complete data sets with gaps filled in using avg. of
%surrounding cells

%load in complete data sets
load('EVD_durhammean2_18.mat');
load('D_2018_DailyRH2.mat');

figure
scatter(D_2018_DailyRH2, EVD_durhammean2_18)
ylabel ('interpolated PM2.5 (µg/m^3)','FontSize',15);
xlabel ('interpolated Relative Humidity (%)','FontSize',15);
title ('PM 2.5 Concentrations vs. Relative Humidity in Durham 2018', 'FontSize', 15);
%linear fit a,b represent slope and y-int.
[a,b] = linfit(D_2018_DailyRH2, EVD_durhammean2_18);
hold on
plot (D_2018_DailyRH2, a+b*D_2018_DailyRH2);

%r and p values of pm2.5 vx. relative humidity
[R,P] = corrcoef(D_2018_DailyRH2, EVD_durhammean2_18); %stat sig from 0 w. 99% certainty, that its not random
%% AQI Time Series Plots 
%%
%Fairbanks 2013
smooth_FBsite10_AQI_2013= movmean(FB_site10_AQI_13,10);
std_FBsite10_AQI_2013= movstd(FB_site10_AQI_13,10);

figure; clf
subplot (2,2,1)
hold on
plot(FB_site10_date_13, FB_site10_AQI_13, '.')
plot(FB_site10_date_13, smooth_FBsite10_AQI_2013)
yline(50)
xlabel('Time (month)')
ylabel('Air Quality Index')
title('Air Quality Index for Fairbanks, AK (Site 10)')
legend("Site 10 AQI", "1 Month Moving Mean")

%Durham 2013 
smooth_durham_AQI_2013= movmean(durhamAQI_13,5)
std_durham_AQI_2013= movstd(durhamAQI_13,5)

subplot (2,2,2)
hold on
plot(durhamtime_13, durhamAQI_13, '.')
plot(durhamtime_13,smooth_durham_AQI_2013)
yline(50)
xlabel('Time (month)')
ylabel('Air Quality Index')
title('Air Quality Index for Durham, NH')
legend("Site 14 Data Points", "1 Month Moving Mean")

%Fairbanks 2018
smooth_FBsite10_AQI_2018= movmean(FB_site10_AQI_18,5);
std_FBsite10_AQI_2018= movstd(FB_site10_AQI_18,5);

subplot (2,2,3)
hold on
plot(FB_site10_date_18, FB_site10_AQI_18, '.')
plot(FB_site10_date_18, smooth_FBsite10_AQI_2018)
yline(50)
xlabel('Time (month)')
ylabel('Air Quality Index')
title('Air Quality Index for Fairbanks, AK (Site 10)')
legend("Site 10 AQI","1 Month Moving Mean")

%Durham 2018
smooth_durham_AQI_2018= movmean(durhamAQI_18,3);
std_durham_AQI_2018= movstd(durhamAQI_18,3);

subplot (2,2,4)
hold on
plot(durhamtime_18, durhamAQI_18, '.')
plot(durhamtime_18,smooth_durham_AQI_2018)
yline(50)
xlabel('Time (month)')
ylabel('Air Quality Index')
title('Air Quality Index for Durham, NH')
legend("Site 14 AQI","1 Month Moving Mean")

%% STD Plot for PM 2.5 

figure; clf
subplot(4,1,1)
hold on
plot(FB_site10_date_13, std_FBsite10_mean_2013)
xlabel('Time (month)')
ylabel('1 Month Moving STD')
title('1 Month Moving Std for Fairbanks, AK (Site 10)')

subplot(4,1,2)
hold on
plot(durhamtime_13, std_durham_mean_2013)
xlabel('Time (month)')
ylabel('1 Month Moving STD')
title('1 Month Moving Std for Durham, NH')

subplot(4,1,3)
hold on
plot(FB_site10_date_18, std_FBsite10_mean_2018)
xlabel('Time (month)')
ylabel('1 Month Moving STD')
title('1 Month Moving Std for Fairbanks, AK (Site 10)')

subplot(4,1,4)
hold on
plot(EVD_durhamtime_18,EVD_std_durham_mean_2018)
xlabel('Time (month)')
ylabel('1 Month Moving STD')
title('1 Month Moving Std for Durham, NH')
%% AQI correlation to humidity, distribution plots of data sets (stats)
%%
pm25data_2013 = readtable('./PM2.5_data/daily_88101_2013.csv');
pm25data_2018 = readtable('./PM2.5_data/daily_88101_2018.csv');

NO2data_2013 = readtable('./NO2_data/daily_42602_2013.csv');
NO2data_2018 = readtable('./NO2_data/daily_42602_2018.csv');

%%
pm25_fairbanks_2013 = pm25data_2013(pm25data_2013.CityName == "Fairbanks",:);
pm25_fairbanks_2018 = pm25data_2018(pm25data_2018.CityName == "Fairbanks",:);

%pm25_fairbanks_2013 = pm25data_2013(pm25data_2013.Latitude == 64.840672000000000 & pm25data_2013.Longitude == ,:);
%pm25_fairbanks_2018 = pm25data_2018(pm25data_2018.Latitude == 64.8407 & pm25data_2018.Longitude == -147.7225,:);

pm25_durham_2013 = pm25data_2013(pm25data_2013.CityName == "Durham", :);
pm25_durham_2018 = pm25data_2018(pm25data_2018.CityName == "Durham",:);

pm25_mean_durham_2013 = pm25_durham_2013.ArithmeticMean;
pm25_mean_fairbanks_2013 = pm25_fairbanks_2013.ArithmeticMean;

pm25_mean_durham_2018 = pm25_durham_2018.ArithmeticMean;
pm25_mean_fairbanks_2018 = pm25_fairbanks_2018.ArithmeticMean;

% fill in missing values to standardize the lengths of the data
% current approach is to fill in with the mean 
pm25_mean_durham_2013 = cat(1, pm25_mean_durham_2013, ((max(pm25_mean_durham_2013) - min(pm25_mean_durham_2018) )) * rand(156, 1) + min(pm25_mean_durham_2013));
pm25_mean_fairbanks_2018 = cat(1, pm25_mean_fairbanks_2018, mean(pm25_mean_fairbanks_2018) * ones(53, 1));

%%
%Box and Whiskers of pm2.5 concentration in 2013 across both stations%
plot(1)
boxplot([pm25_mean_durham_2013, pm25_mean_fairbanks_2013], 'Notch', 'on', 'Labels', {'Durham', 'Fairbanks'}, 'symbol', '+')
xlabel("Station")
ylabel("Concentration")
title('Mean Daily PM2.5 Concentration (2013)')

median(pm25_mean_durham_2013)
median(pm25_mean_fairbanks_2013)

%%
%Box and Whiskers of pm2.5 concentration in 2013 across both stations%
plot(2)
boxplot([pm25_mean_durham_2018, pm25_mean_fairbanks_2018], 'Notch', 'on', 'Labels', {'Durham', 'Fairbanks'}, 'symbol', '+')
xlabel("Station")
ylabel("Concentration")
title('Mean Daily PM2.5 Concentration (2018)')

median(pm25_mean_durham_2013)
median(pm25_mean_fairbanks_2013)
 
%% exploratory plots mentioned in report
% run normplot to test whether pm2.5 data is normally distributed
% we see that the distribution is right-tailed, meaning a higher
% number of concentrations above the mean are found in the data
% because of this, we cannot assume a normal distribution and cannot use a
% t-test
plot(2)
title("Test for Normality in PM2.5 Concentration")

subplot(2, 2, 1)
normplot(pm25_mean_durham_2013)
title("pm2.5 Concentrations Durham 2013")

subplot(2, 2, 2)
normplot(pm25_mean_fairbanks_2013)
title("pm2.5 Concentrations Fairbanks 2013")

subplot(2, 2, 3)
normplot(pm25_mean_durham_2018)
title("pm2.5 Concentrations Durham 2018")

subplot(2, 2, 4)
normplot(pm25_mean_fairbanks_2018)
title("pm2.5 Concentrations Fairbanks 2018")

%%
% run Wilcoxon rank sum test  
% different stations, same year
[p_2013, h_2013] = ranksum(pm25_mean_durham_2013, pm25_mean_fairbanks_2013(1:121));
[p_2018, h_2018] = ranksum(pm25_mean_durham_2018(1:766), pm25_mean_fairbanks_2018);

% same station, different years
[p_durham, h_durham] = ranksum(pm25_mean_durham_2013, pm25_mean_fairbanks_2018);
[p_fairbanks, h_fairbanks] = ranksum(pm25_mean_fairbanks_2013, pm25_mean_fairbanks_2018);

% tests against the null hypothesis of equal medians
% low p-values are evidence that we can reject the null and the medians are different

%%
% now, load in the humidity dataset at specific locations per year q
humidity_fairbanks_2013 = readtable('./Humidity_data/CRND0103-2013-AK_Fairbanks_11_NE.csv');
humidity_durham_2013 = readtable('./Humidity_data/CRND0103-2013-NH_Durham_2_SSW.csv');

humidity_fairbanks_2018 = readtable('./Humidity_data/CRND0103-2018-AK_Fairbanks_11_NE.csv');
humidity_durham_2018 = readtable('./Humidity_data/CRND0103-2018-NH_Durham_2_SSW.csv');

%date_2013 = table2array(humidity_durham_2013(:,2));
date_2013 = datetime(2013,1,1,8,0,0):datetime(2013, 12, 31, 8, 0, 0);

date_2018 = table2array(humidity_durham_2018(:, 2));

humidity_col_fairbanks_2013 = table2array(humidity_fairbanks_2013(:,18));
humidity_col_durham_2013 = table2array(humidity_fairbanks_2013(:,18));

humidity_col_fairbanks_2018 = table2array(humidity_fairbanks_2018(:,18));
humidity_col_durham_2018 = table2array(humidity_fairbanks_2018(:,18));

%%
aqi_fairbanks = pm25_fairbanks_2018;
monthly_averages [];

% First, get the monthly averages across the aqi and humidity data 
for month = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
end 
%%
% plot a scatterplot of humidity versus air quality for Fairbanks in 2018 
plot(3)
title("Correlation between Humidity and Air Quality Across Locations")

subplot(2, 2, 1)
plot(humidity_col_durham_2013, humidity_col_fairbanks_2018, '.k') 

subplot(2, 2, 2);
plot(humidity_col_durham_2013, humidity_col_fairbanks_2018, '.k') 

subplot(2, 2, 3);
plot(humidity_col_durham_2013, humidity_col_fairbanks_2018, '.k') 

subplot(2, 2, 4);
plot(humidity_col_durham_2013, humidity_col_fairbanks_2018, '.k') 