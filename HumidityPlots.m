%addpath ('/Users/gracegjerde/Desktop/Final Project Data/');
addpath ('/Users/murpa/Dropbox/My PC (DESKTOP-NRG87VG)/Documents/ENVS Data and Analysis/Final Project/')
%% Loading Data
%NOAA Fairbanks
Fairbanks_2013 = readtable('CRND0103-2013-AK_Fairbanks_11_NE.csv'); 
Fairbanks_2018 = readtable('CRND0103-2018-AK_Fairbanks_11_NE.csv');
%NOAA Durham
Durham_2013 = readtable('CRND0103-2013-NH_Durham_2_SSW.csv');
Durham_2018 = readtable('CRND0103-2018-NH_Durham_2_SSW.csv');
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
xlabel('DOY')
ylabel ('Daily Humidity')


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
xlabel('DOY')
ylabel ('Daily Humidity')


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
xlabel('DOY')
ylabel ('Daily Humidity')
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
xlabel('DOY')
ylabel ('Daily Humidity')
hold off 
