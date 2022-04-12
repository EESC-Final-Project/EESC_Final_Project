pm25data = readtable('daily_88101_2012.csv');

longrid = unique(pm25data.Longitude);
latgrid = unique(pm25data.Latitude);
dategrid= unique(pm25data.DateLocal);
cd 
pm25mean=pm25data.ArithmeticMean;
pm25time= pm25data.DateLocal;

pm25 = NaN(length(longrid),length(latgrid),length(dategrid));

for i = 1:height(pm25data)
    lat = find(pm25data.Latitude(i) == latgrid);
    lon = find(pm25data.Longitude(i) == longrid);
    date = find(pm25data.DateLocal(i) == dategrid);
    pm25(lon,lat,date) = pm25data.ArithmeticMean(i);
end

figure; clf
imagesc(pm25(:,:,1))

figure; clf
plot(pm25time, pm25mean)

fairlat= 64
fairlon= -147

[~,indlat] = min(abs(pm25data.Latitude - fairlat)) 
[~,indlon] = min(abs(pm25data.Longitude - fairlong)) 

%% NO2 Data

no2data = readtable('daily_42602_2012.csv');

longrid = unique(no2data.Longitude);
latgrid = unique(no2data.Latitude);
dategrid= unique(no2data.DateLocal);

no2 = NaN(length(longrid),length(latgrid),length(dategrid));

for i = 1:height(no2data)
    lat = find(no2data.Latitude(i) == latgrid);
    lon = find(no2data.Longitude(i) == longrid);
    date = find(no2data.DateLocal(i) == dategrid);
    no2(lon,lat,date) = no2data.ArithmeticMean(i);
end

figure; clf
imagesc(no2(:,:,1))

