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
subplot (3,1,2)

hold on
%subplot 3 (AQI)
subplot (3,1,3)

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
title ('Relative Daily Humidity at Fairbanks in 2018 (%)','FontSize',20)
xlabel('Month','FontSize',15)
ylabel ('Daily Humidity (%)','FontSize',15)
%legend('Raw Humidity Data', '30 day moving mean')
datetick('x', 3 , 'keeplimits')

hold on
%subplot 2 (PM 2.5 Data)
subplot (3,1,2)

%INSERT PM 2.5 DATA HERE

hold on
%subplot 3 (AQI)
subplot (3,1,3)

%INSERT AQI DATA HERE

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
title ('Relative Daily Humidity at Durham in 2013 (%)','FontSize',20)
xlabel('Month','FontSize',15)
ylabel ('Daily Humidity (%)','FontSize',15)
%legend('Fairbanks','Durham','FontSize',11)
datetick('x', 3 , 'keeplimits')

hold on
%subplot 2 (PM 2.5 Data)
subplot (3,1,2)

%INSERT PM 2.5 DATA HERE

hold on
%subplot 3 (AQI)
subplot (3,1,3)

%INSERT AQI DATA HERE

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
subplot (3,1,2)

%INSERT PM 2.5 DATA HERE

hold on
%subplot 3 (AQI)
subplot (3,1,3)

%INSERT AQI DATA HERE


