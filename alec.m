pm25data_2012 = readtable('./PM2.5_data/daily_88101_2012.csv');
pm25data_2018 = readtable('./PM2.5_data/daily_88101_2018.csv');

NO2data_2012 = readtable('./NO2_data/daily_42602_2012.csv');
NO2data_2018 = readtable('./NO2_data/daily_42602_2018.csv');


% step 1: get the pm25 data for fairbanks and durham only %
pm25_fairbanks_2012 = pm25data_2012(pm25data_2012.CityName == "Fairbanks",:);
pm25_fairbanks_2018 = pm25data_2018(pm25data_2018.CityName == "Fairbanks",:);

pm25_durham_2012 = pm25data_2012(pm25data_2012.CityName == "Durham",:);
pm25_durham_2018 = pm25data_2018(pm25data_2018.CityName == "Durham",:);


% step 2: 