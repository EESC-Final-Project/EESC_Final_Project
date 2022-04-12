pm25data = readtable('daily_88101_2012.csv');

pmlongrid = unique(pm25data.Longitude);
pmlatgrid = unique(pm25data.Latitude);
pmdategrid= unique(pm25data.DateLocal);

pm25mean=pm25data.ArithmeticMean;
pm25time= pm25data.DateLocal;

pm25 = NaN(length(pmlongrid),length(pmlatgrid),length(pmdategrid));

for i = 1:height(pm25data)
    lat = find(pm25data.Latitude(i) == pmlatgrid);
    lon = find(pm25data.Longitude(i) == pmlongrid);
    date = find(pm25data.DateLocal(i) == pmdategrid);
    pm25(lon,lat,date) = pm25data.ArithmeticMean(i);
end

figure; clf
imagesc(pm25(:,:,1))

figure; clf
scatter(pm25time, pm25mean, '.')

fairlat= 64
fairlon= -147

[~,indfairlat] = min(abs(pmlatgrid - fairlat)) 
[~,indfairlon] = min(abs(pmlongrid - fairlon)) 

fairbanksdata= squeeze(pm25(indfairlon,indfairlat,:));

fairbanksdata2= pm25data.ArithmeticMean(4961:5081)
fairbanksdatatime=pm25data.DateLocal(4961:5081)

plot(fairbanksdatatime, fairbanksdata2, '.')

durhamlat= 43.1010 
durhamlon= -79.960757000000001

[~,inddurlat] = min(abs(pm25.Latitude - durhamlat)) 
indurlat= find(pm25data.Latitude==durhamlat)
indurlon= find(pm25data.Longitude == durhamlon);
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

