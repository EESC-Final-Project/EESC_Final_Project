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
 

%%
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


