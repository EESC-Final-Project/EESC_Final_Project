pm25data_2012 = readtable('./PM2.5_data/daily_88101_2012.csv');
pm25data_2018 = readtable('./PM2.5_data/daily_88101_2018.csv');

NO2data_2012 = readtable('./NO2_data/daily_42602_2012.csv');
NO2data_2018 = readtable('./NO2_data/daily_42602_2018.csv');


% step 1: get the pm25 data for fairbanks and durham only %
pm25_fairbanks_2012 = pm25data_2012(pm25data_2012.CityName == "Fairbanks",:);
pm25_fairbanks_2018 = pm25data_2018(pm25data_2018.CityName == "Fairbanks",:);

pm25_durham_2012 = pm25data_2012(pm25data_2012.CityName == "Durham",:);
pm25_durham_2018 = pm25data_2018(pm25data_2018.CityName == "Durham",:);


% step 2: run some significance tests 
% run a significance test for the mean of pm2.5 data across both locations
% in 2012 

pm25_mean_durham = pm25_durham_2012.ArithmeticMean;
pm25_mean_fairbanks = pm25_fairbanks_2012.ArithmeticMean;

mean_pm25_2012 = [pm25_durham_2012.ArithmeticMean pm25_fairbanks_2012.ArithmeticMean];
% normplot(mean_pm25_2012)

sample_means = mean(mean_pm25_2012);