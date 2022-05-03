addpath ('/Users/gracegjerde/Desktop/Final Project Data/');
%addpath ('/Users/murpa/Dropbox/My PC (DESKTOP-NRG87VG)/Documents/ENVS Data and Analysis/Final Project/')
%% Loading Data
%NOAA Fairbanks
Fairbanks_2013 = readtable('CRND0103-2013-AK_Fairbanks_11_NE.csv'); 
Fairbanks_2018 = readtable('CRND0103-2018-AK_Fairbanks_11_NE.csv');
%NOAA Durham
Durham_2013 = readtable('CRND0103-2013-NH_Durham_2_SSW.csv');
Durham_2018 = readtable('CRND0103-2018-NH_Durham_2_SSW.csv');
%NOAA Iowa
%% Time Series Fairbanks
F_2013_DailyRH = table2array(Fairbanks_2013(:,18));
F_2018_DailyRH = table2array(Fairbanks_2018(:,18));

%2013
%data we want to include (-9999 = NaN in this data)
ind=find(F_2013_DailyRH >= -9998);
time = (1:365);
figure (1)
smooth_RH_F_2013 = movmean(F_2013_DailyRH(ind),30);
RH_F_std_2013 = std(smooth_RH_F_2013);
scatter (time(ind),F_2013_DailyRH(ind))
hold on
plot (time(ind),smooth_RH_F_2013,'-');
%errorbar(time(ind),smooth_RH_F_2013,RH_F_std_2013);
title ('Relative Daily Humidity at Fairbanks in 2013 (%)')
xlabel('Month')
ylabel ('Daily Humidity')
legend('Raw Humidity Data', '30 day moving mean')
datetick('x', 3 , 'keeplimits')



%2018
%data we want to include (-9999 = NaN in this data)
ind=find(F_2018_DailyRH >= -9998);
time = (1:365);
figure (2)
smooth_RH_F_2018 = movmean(F_2018_DailyRH(ind),30);
RH_F_std_2018 = std(smooth_RH_F_2018);
scatter (time(ind),F_2018_DailyRH(ind))
hold on
plot (time(ind),smooth_RH_F_2018,'-');
title ('Relative Daily Humidity at Fairbanks in 2018 (%)')
xlabel('Month')
ylabel ('Daily Humidity')
legend('Raw Humidity Data', '30 day moving mean')
datetick('x', 3 , 'keeplimits')


%% Time Series Durham
D_2013_DailyRH = table2array(Durham_2013(:,18));
D_2018_DailyRH = table2array(Durham_2018(:,18));

%2013
%data we want to include (-9999 = NaN in this data)
ind=find(D_2013_DailyRH >= -9998);
time = (1:365);
figure (3)
smooth_RH_D_2013 = movmean(D_2013_DailyRH(ind),30);
RH_D_std_2013 = std(smooth_RH_D_2013);
scatter (time(ind),D_2013_DailyRH(ind))
hold on
plot (time(ind),smooth_RH_D_2013,'-');
title ('Relative Daily Humidity at Durham in 2013 (%)')
xlabel('Month')
ylabel ('Daily Humidity')
legend('Raw Humidity Data', '30 day moving mean')
datetick('x', 3 , 'keeplimits')
hold off 

%2018
%data we want to include (-9999 = NaN in this data)
ind=find(D_2018_DailyRH >= -9998);
time = (1:365);
figure (4)
smooth_RH_D_2018 = movmean(D_2018_DailyRH(ind),30);
RH_D_std_2018 = std(smooth_RH_D_2018);
scatter (time(ind),D_2018_DailyRH(ind))
hold on
plot (time(ind),smooth_RH_D_2018,'-');
title ('Relative Daily Humidity at Durham in 2018 (%)')
xlabel('Month')
ylabel ('Daily Humidity')
legend('Raw Humidity Data', '30 day moving mean')
datetick('x', 3 , 'keeplimits')
hold off 

%%
% all plots on top of eachother
%2013
subplot (2,1,1)
ind=find(F_2013_DailyRH >= -9998);
time = (1:365);
figure (1)
smooth_RH_F_2013 = movmean(F_2013_DailyRH(ind),30);
RH_F_std_2013 = std(smooth_RH_F_2013);
%scatter (time(ind),F_2013_DailyRH(ind))
hold on
plot (time(ind),smooth_RH_F_2013,'-');
%errorbar(time(ind),smooth_RH_F_2013,RH_F_std_2013);
title ('Relative Daily Humidity 2013 (%)','FontSize',20)
xlabel('Month')
ylabel ('Daily Humidity')
%legend('Raw Humidity Data', '30 day moving mean')
datetick('x', 3 , 'keeplimits')
hold on

subplot (2,1,1)
hold on
ind=find(D_2013_DailyRH >= -9998);
time = (1:365);
smooth_RH_D_2013 = movmean(D_2013_DailyRH(ind),30);
RH_D_std_2013 = std(smooth_RH_D_2013);
%scatter (time(ind),D_2013_DailyRH(ind))
hold on
plot (time(ind),smooth_RH_D_2013,'-');
title ('Relative Daily Humidity in 2013 (%)')
xlabel('Month','FontSize',15)
ylabel ('Daily Humidity (%)','FontSize',15)
legend('Fairbanks','Durham','FontSize',11)
datetick('x', 3 , 'keeplimits')

hold on 
subplot (2,1,2)
ind=find(F_2018_DailyRH >= -9998);
time = (1:365);
smooth_RH_F_2018 = movmean(F_2018_DailyRH(ind),30);
RH_F_std_2018 = std(smooth_RH_F_2018);
%scatter (time(ind),F_2018_DailyRH(ind))
hold on
plot (time(ind),smooth_RH_F_2018,'-');
title ('Relative Daily Humidity at Fairbanks in 2018 (%)')
xlabel('Month','FontSize',20)
ylabel ('Daily Humidity (%)')
%legend('Raw Humidity Data', '30 day moving mean')
datetick('x', 3 , 'keeplimits')

hold on
subplot (2,1,2)
ind=find(D_2018_DailyRH >= -9998);
time = (1:365);
smooth_RH_D_2018 = movmean(D_2018_DailyRH(ind),30);
RH_D_std_2018 = std(smooth_RH_D_2018);
%scatter (time(ind),D_2018_DailyRH(ind))
hold on
plot (time(ind),smooth_RH_D_2018,'-');
title ('Relative Daily Humidity in 2018 (%)','FontSize',20)
xlabel('Month','FontSize',15)
ylabel ('Daily Humidity (%)','FontSize',15)
legend('Fairbanks', 'Durham','FontSize',11)
datetick('x', 3 , 'keeplimits')
hold off 

%% sublot of PM2.5, AQI, and Relative Humidity Fairbanks 2013 (START HERE HANNAH!)
addpath ('/Users/gracegjerde/Desktop/Final Project Data/All PM 2.5 Data/');

%Fairbanks 2013
%subplot 1 (Humidity Data)
figure
subplot (3,1,1)
ind=find(F_2013_DailyRH >= -9998);
time = (1:365);
figure (1)
smooth_RH_F_2013 = movmean(F_2013_DailyRH(ind),30);
RH_F_std_2013 = std(smooth_RH_F_2013);
%scatter (time(ind),F_2013_DailyRH(ind))
hold on
plot (time(ind),smooth_RH_F_2013,'-');
%errorbar(time(ind),smooth_RH_F_2013,RH_F_std_2013);
title ('Relative Daily Humidity at Fairbanks 2013 (%)','FontSize',20)
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

subplot (3,1,2)
hold on
plot(FB_site10_date_13, FB_site10_mean_13, '.')
plot(FB_site10_date_13, smooth_FBsite10_mean_2013)
xlabel('Time (month)','FontSize',15)
ylabel('PM 2.5 Concentrations (µg/m^3)','FontSize',15)
title('PM 2.5 Concentrations for Fairbanks, AK','FontSize',20)
legend("Site 10 Data Points", "1 Month Moving Mean")


hold on
%subplot 3 (AQI)
smooth_FBsite10_AQI_2013= movmean(FB_site10_AQI_13,10);

std_FBsite10_AQI_2013= movstd(FB_site10_AQI_13,10);

subplot (3,1,3)
hold on
plot(FB_site10_date_13, FB_site10_AQI_13, '.')
plot(FB_site10_date_13, smooth_FBsite10_AQI_2013)
yline(50)
xlabel('Time (month)','FontSize',15)
ylabel('Air Quality Index','FontSize',15)
title('Air Quality Index for Fairbanks, AK','FontSize',20)
legend("Site 10 AQI", "1 Month Moving Mean")


%% Fairbanks 2018 (PM 2.5, AQI, RH)

% Fairbanks 2018
figure (2)
subplot (3,1,1)
ind=find(F_2018_DailyRH >= -9998);
time = (1:365);
smooth_RH_F_2018 = movmean(F_2018_DailyRH(ind),30);
RH_F_std_2018 = std(smooth_RH_F_2018);
%scatter (time(ind),F_2018_DailyRH(ind))
hold on
plot (time(ind),smooth_RH_F_2018,'-');
title ('Relative Daily Humidity at Fairbanks in 2018','FontSize',20)
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


subplot (3,1,2)
hold on
plot(FB_site10_date_18, FB_site10_mean_18, '.')
plot(FB_site10_date_18, smooth_FBsite10_mean_2018)
xlabel('Time (month)','FontSize',15)
ylabel('PM 2.5 Concentration (µg/m^3)','FontSize',15)
title('PM 2.5 Concentration for Fairbanks, AK','FontSize',20)
legend("Site 10 Data Points", "1 Month Moving Mean")

hold on
%subplot 3 (AQI)
%AQI
smooth_FBsite10_AQI_2018= movmean(FB_site10_AQI_18,5);

std_FBsite10_AQI_2018= movstd(FB_site10_AQI_18,5);

subplot (3,1,3)
hold on
plot(FB_site10_date_18, FB_site10_AQI_18, '.')
plot(FB_site10_date_18, smooth_FBsite10_AQI_2018)
yline(50)
xlabel('Time (month)','FontSize',15)
ylabel('Air Quality Index','FontSize',15)
title('Air Quality Index for Fairbanks, AK','FontSize',20)
legend("Site 10 AQI","1 Month Moving Mean")


%% Durham 2013 (PM 2.5, AQI, RH)
figure (3)
subplot (3,1,1)
hold on
ind=find(D_2013_DailyRH >= -9998);
time = (1:365);
smooth_RH_D_2013 = movmean(D_2013_DailyRH(ind),30);
RH_D_std_2013 = std(smooth_RH_D_2013);
%scatter (time(ind),D_2013_DailyRH(ind))
hold on
plot (time(ind),smooth_RH_D_2013,'-');
title ('Relative Daily Humidity at Durham in 2013','FontSize',20)
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


subplot (3,1,2)
hold on
plot(durhamtime_13, durhammean_13, '.')
plot(durhamtime_13,smooth_durham_mean_2013)
xlabel('Time (month)','FontSize',15)
ylabel('PM 2.5 Concentration (µg/m^3)','FontSize',15)
title('PM 2.5 Concentration for Durham, NH','FontSize',20)
legend("Site 14 Data Points", "1 Month Moving Mean")


hold on
%subplot 3 (AQI)
smooth_durham_AQI_2013= movmean(durhamAQI_13,5)
std_durham_AQI_2013= movstd(durhamAQI_13,5)

subplot (3,1,3)
hold on
plot(durhamtime_13, durhamAQI_13, '.')
plot(durhamtime_13,smooth_durham_AQI_2013)
yline(50)
xlabel('Time (month)','FontSize',15)
ylabel('Air Quality Index','FontSize',15)
title('Air Quality Index for Durham, NH','FontSize',20)
legend("Site 14 Data Points", "1 Month Moving Mean")



%% Durham 2018 (PM 2.5, AQI, RH)
figure
subplot (3,1,1)
ind=find(D_2018_DailyRH >= -9998);
time = (1:365);
smooth_RH_D_2018 = movmean(D_2018_DailyRH(ind),30);
RH_D_std_2018 = std(smooth_RH_D_2018);
%scatter (time(ind),D_2018_DailyRH(ind))
hold on
plot (time(ind),smooth_RH_D_2018,'-');
title ('Relative Daily Humidity at Durham in 2018 (%)','FontSize',20)
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


subplot (3,1,2)
hold on
plot(EVD_durhamtime_18, EVD_durhammean_18, '.')
plot(EVD_durhamtime_18,EVD_smooth_durham_mean_2018)
xlabel('Time (month)','FontSize',15)
ylabel('PM 2.5 Concentration (µg/m^3)','FontSize',15)
title('Durham, NH PM 2.5 Concentration','FontSize',20)
legend("Site 14 Data Point","1 Month Moving Mean")


hold on
%subplot 3 (AQI)
%AQI
durhamAQI_18= pm25data_18.AQI(290325:290354);
durhamtime_18=pm25data_18.DateLocal(290325:290354);
smooth_durham_AQI_2018= movmean(durhamAQI_18,3)

subplot (3,1,3)
hold on
plot(durhamtime_18, durhamAQI_18, '.')
plot(durhamtime_18,smooth_durham_AQI_2018)
yline(50)
xlabel('Time (month)','FontSize',15)
ylabel('Air Quality Index','FontSize',15)
title('Air Quality Index for Durham, NH','FontSize',20)
legend("Site 14 AQI","1 Month Moving Mean")
