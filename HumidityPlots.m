addpath ('/Users/gracegjerde/Desktop/Final Project Data/');
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
figure
smooth_RH_F_2013 = movmean(F_2013_DailyRH(ind),30);
scatter (time(ind),F_2013_DailyRH(ind))
hold on
plot (time(ind),smooth_RH_F_2013,'-');
title ('Relative Daily Humidity at Fairbanks in 2013')
xlabel('DOY')
ylabel ('Daily Humidity')


%2018
figure
scatter (1:365,F_2018_DailyRH)
title ('Relative Daily Humidity at Fairbanks in 2018')
xlabel('DOY')
ylabel ('Daily Humidity')
%% Time Series Durham
D_2013_DailyRH = table2array(Durham_2013(:,18));
D_2018_DailyRH = table2array(Durham_2018(:,18));

%2013
figure
scatter (1:365,D_2013_DailyRH)
title ('Relative Daily Humidity at Durham in 2013')
xlabel('DOY')
ylabel ('Daily Humidity')

%2018
figure
scatter (1:365,D_2018_DailyRH)
title ('Relative Daily Humidity at Durham in 2018')
xlabel('DOY')
ylabel ('Daily Humidity')