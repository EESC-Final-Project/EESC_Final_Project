pm25data_2013 = readtable('./PM2.5_data/daily_88101_2013.csv');
pm25data_2018 = readtable('./PM2.5_data/daily_88101_2018.csv');

NO2data_2013 = readtable('./NO2_data/daily_42602_2013.csv');
NO2data_2018 = readtable('./NO2_data/daily_42602_2018.csv');


% step 1: get the pm25 data for fairbanks and durham only %
pm25_fairbanks_2013 = pm25data_2012(pm25data_2013.CityName == "Fairbanks",:);
pm25_fairbanks_2018 = pm25data_2018(pm25data_2018.CityName == "Fairbanks",:);

pm25_durham_2013 = pm25data_2013(pm25data_2013.CityName == "Durham",:);
pm25_durham_2018 = pm25data_2018(pm25data_2018.CityName == "Durham",:);


% step 2: run some significance tests 
% run a significance test for the mean of pm2.5 data across both locations
% in 2012 

pm25_mean_durham_2013 = pm25_durham_2013.ArithmeticMean;
pm25_mean_fairbanks_2013 = pm25_fairbanks_2013.ArithmeticMean;

%we need to extend the data for durham in 2013 to match the size of fairbanks%
%pm25_mean_durham_2013 = nan(size(pm25_fairbanks_2013) + (size(pm25_mean_fairbanks_2013, 1) - size(pm25_mean_durham_2013, 1)));

mean_NAs = nan(size(pm25_mean_fairbanks_2013, 1));
means_NAs(1:length(pm25_mean_durham_2013)) = pm25_mean_durham_2013;


mean_pm25_2013 = [pm25_mean_durham_2013 pm25_mean_fairbanks_2013];
normplot(mean_pm25_2013)

sample_means = mean(mean_pm25_2013);