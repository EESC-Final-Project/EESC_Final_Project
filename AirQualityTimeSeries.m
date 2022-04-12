addpath ('/Users/gracegjerde/Desktop/Final Project Data/All NO2 Data/');
addpath ('/Users/gracegjerde/Desktop/Final Project Data/All PM 2.5 Data/');
%% Loading Data
%PM 2.5
PM_data = readtable('daily_88101_2012.csv');

for i=12:21
    filename = "daily_88101_20"+i+".csv";
    PM_data = readtable(filename);
    pm{i}.lat = PM_data.Latitude;
    pm{i}.lon = PM_data.Longitude;
    % I think Arithmetic Mean is the PM2.5 observation value?
    pm{i}.mean = PM_data.ArithmeticMean;
end
%NOx,NOy