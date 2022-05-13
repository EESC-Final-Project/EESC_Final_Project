addpath ('/Users/gracegjerde/Desktop/Final Project Data/');
%addpath ('/Users/murpa/Dropbox/My PC (DESKTOP-NRG87VG)/Documents/ENVS Data and Analysis/Final Project/')
%% Loading Data
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


