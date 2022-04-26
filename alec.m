%%
pm25data_2013 = readtable('./PM2.5_data/daily_88101_2013.csv');
pm25data_2018 = readtable('./PM2.5_data/daily_88101_2018.csv');

NO2data_2013 = readtable('./NO2_data/daily_42602_2013.csv');
NO2data_2018 = readtable('./NO2_data/daily_42602_2018.csv');
%%

%%
pm25_fairbanks_2013 = pm25data_2013(pm25data_2013.CityName == "Fairbanks",:);
pm25_fairbanks_2018 = pm25data_2018(pm25data_2018.CityName == "Fairbanks",:);

pm25_durham_2013 = pm25data_2013(pm25data_2013.CityName == "Durham",:);
pm25_durham_2018 = pm25data_2018(pm25data_2018.CityName == "Durham",:);

% step 2: run some significance tests 
% run a significance test for the mean of pm2.5 data across both locations
% in 2012 

pm25_mean_durham_2013 = pm25_durham_2018.ArithmeticMean;
pm25_mean_fairbanks_2013 = pm25_fairbanks_2018.ArithmeticMean;

pm25_mean_durham_2018 = pm25_durham_2018.ArithmeticMean;
pm25_mean_fairbanks_2018 = pm25_fairbanks_2018.ArithmeticMean;
%%
%Box and Whiskers of pm2.5 concentration in 2013 across both stations%
boxplot([pm25_mean_durham_2013(1:766), pm25_mean_fairbanks_2013], 'Notch', 'on', 'Labels', {'Durham', 'Fairbanks'})
xlabel("Station")
ylabel("Concentration")
title('Mean Daily PM2.5 Concentration (2013)')
%%
%Box and Whiskers of pm2.5 concentration in 2018 across both stations%
boxplot([pm25_mean_durham_2018(1:766), pm25_mean_fairbanks_2018], 'Notch', 'on', 'Labels', {'Durham', 'Fairbanks'})
xlabel("Station")
ylabel("Concentration")
title('Mean Daily PM2.5 Concentration (2018)')
%%
% run normplot to test whether pm2.5 data is normally distributed
% we see that the distribution is right-tailed, meaning a higher
% number of concentrations above the mean are found in the data
% because of this, we cannot assume a normal distribution and cannot use a
% t-test
figure;
clf; 

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
normplot(pm25_mean_fairbanks_2013)
title("pm2.5 Concentrations Fairbanks 2018")

%%
% run Wilcoxon rank sum test  
[p_2013, h_2013] = ranksum(pm25_mean_durham_2013(1:766), pm25_mean_fairbanks_2013);
[p_2018, h_2018] = ranksum(pm25_mean_durham_2018(1:766), pm25_mean_fairbanks_2018);

% tests against the null hypothesis of equal medians
% low p-values are evidence that we can reject the null and the medians are different

%%