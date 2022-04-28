pm25data = readtable('daily_88101_2012.csv');

pmlongrid = unique(pm25data.Longitude);
pmlatgrid = unique(pm25data.Latitude);
pmdategrid= unique(pm25data.DateLocal);

pmlat=pm25data.Longitude;
pmlon=pm25data.Latitude; 

pm25mean=pm25data.ArithmeticMean;
pm25time= pm25data.DateLocal;

pm25 = NaN(length(pmlatgrid),length(pmlongrid),length(pmdategrid));

for i = 1:height(pm25data)
    lat = find(pm25data.Latitude(i) == pmlatgrid);
    lon = find(pm25data.Longitude(i) == pmlongrid);
    date = find(pm25data.DateLocal(i) == pmdategrid);
    pm25(lat,lon,date) = pm25data.ArithmeticMean(i);
end

figure; clf
imagesc(pm25(:,:,1))

testarray=NaN(length(pmlat),1);
for i=1:length(testarray)
    testarray(i)=1;
end

figure; clf
scatter(pm25time, pm25mean, '.')

figure; clf
worldmap([17.7125 64.8457], [-159.3662 -64.7849])
load coastlines
plotm(coastlat,coastlon)
plotm(pmlat, pmlon,testarray(:,1),'markersize',15)
colorbar;

fairlat= 64
fairlon= -147

[~,indfairlat] = min(abs(pmlatgrid - fairlat)) 
[~,indfairlon] = min(abs(pmlongrid - fairlon)) 

fairbanksdata= squeeze(pm25(indfairlon,indfairlat,:));

fairbanksdata2= pm25data.ArithmeticMean(4961:5081)
fairbanksdatatime=pm25data.DateLocal(4961:5081)
fairbankAQI= pm25data.AQI(4961:5081);

figure; clf
hold on
plot(fairbanksdatatime, fairbanksdata2, '.')
xlabel('Time (month)')
ylabel('2.5 Concontration (µg/meter^3')
title('Fairbanks PM 2.5 Concontration (µg/m^3)')

figure; clf
hold on
plot(fairbanksdatatime, fairbankAQI, '.')
xlabel('Time (month)')
ylabel('Air Quality Index')
title('Air Quality Index for Fairbanks, AK')

durhamlat= 43
durhamlon= -70

durhammean= pm25data.ArithmeticMean(170879:171346);
durhamtime=pm25data.DateLocal(170879:171346);
durhamAQI= pm25data.AQI(170879:171346);

figure; clf
hold on
plot(durhamtime, durhammean, '.')
xlabel('Time (month)')
ylabel('2.5 Concontration (µg/m^3')
title('Durham, NH PM 2.5 Concontration (µg/m^3)')

figure; clf
hold on
plot(durhamtime, durhamAQI, '.')
xlabel('Time (month)')
ylabel('Air Quality Index')
title('Air Quality Index for Durham, NH')

[~,inddurlat] = min(abs(pm25data.Latitude - durhamlat))
[~,inddurlon]= min(abs(pm25data.Longitude- durhamlon))


indurlat= find(pm25data.Latitude==durhamlat)
indurlon= find(pm25data.Longitude == durhamlon);
inddurname=find(pm25data.CityName == )

fairbanksdata2= pm25data.ArithmeticMean(4961:5081)
fairbanksdatatime=pm25data.DateLocal(4961:5081)

pm3D= squeeze(pm25);

figure; clf
hold on
worldmap ([17.7125 64.8457], [-159.3662 -64.7849])
contourfm(pmlatgrid, pmlongrid, pm25(:, :, 2),'linecolor','none');
colorbar
geoshow('landareas.shp','FaceColor','black')
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

%% 2013 PM 2.5 Data

pm25data_13 = readtable('daily_88101_2013.csv');

% fairlat= 64
% fairlon= -147

%[~,indfairlat] = min(abs(pmlatgrid - fairlat)) 
%[~,indfairlon] = min(abs(pmlongrid - fairlon)) 

%one year sets at Fairbanks, AK- site 10: 4348:4459, site 34: 4508:4618

FB_site10_mean_13= pm25data_13.ArithmeticMean(4348:4459);
FB_site10_date_13=pm25data_13.DateLocal(4348:4459);
FB_site10_AQI_13= pm25data_13.AQI(4348:4459);

FB_site34_mean_13= pm25data_13.ArithmeticMean(4508:4618);
FB_site34_date_13=pm25data_13.DateLocal(4508:4618);
FB_site34_AQI_13= pm25data_13.AQI(4508:4618);


smooth_FBsite10_mean_2013= movmean(FB_site10_mean_13,7);
smooth_FBsite34_mean_2013= movmean(FB_site34_mean_13,7);


figure; clf
hold on
plot(FB_site10_date_13, FB_site10_mean_13, '.')
plot(FB_site10_date_13, smooth_FBsite10_mean_2013)
xlabel('Time (month)')
ylabel('2.5 Concontration (µg/meter^3')
title('Fairbanks (Site 10) PM 2.5 Concontration (µg/m^3)')

figure; clf
hold on
plot(FB_site34_date_13, FB_site34_mean_13, '.')
plot(FB_site34_date_13, smooth_FBsite34_mean_2013)
xlabel('Time (month)')
ylabel('2.5 Concontration (µg/meter^3')
title('Fairbanks (Site 34) PM 2.5 Concontration (µg/m^3)')

smooth_FBsite10_AQI_2013= movmean(FB_site10_AQI_13,7);
smooth_FBsite34_AQI_2013= movmean(FB_site34_AQI_13,7);

figure; clf
hold on
plot(FB_site10_date_13, FB_site10_AQI_13, '.')
plot(FB_site10_date_13, smooth_FBsite10_AQI_2013)
xlabel('Time (month)')
ylabel('Air Quality Index')
title('Air Quality Index for Fairbanks, AK (Site 10)')

figure; clf
hold on
plot(FB_site34_date_13, FB_site34_AQI_13, '.')
plot(FB_site34_date_13, smooth_FBsite34_AQI_2013)
xlabel('Time (month)')
ylabel('Air Quality Index')
title('Air Quality Index for Fairbanks, AK (Site 34)')

% durhamlat= 43
% durhamlon= -70

%[~,inddurlat] = min(abs(pm25data_2013.Latitude - durhamlat))
%[~,inddurlon]= min(abs(pm25data_2013.Longitude- durhamlon))

%durham ind site 14: 194130:194862... every few days: 194130:194190,
%everyday: 194190:194457

durhammean_13= pm25data_13.ArithmeticMean(194130:194190);
durhamtime_13=pm25data_13.DateLocal(194130:194190);
durhamAQI_13= pm25data_13.AQI(194130:194190);

smooth_durham_mean_2013= movmean(durhammean_13,7)

figure; clf
hold on
plot(durhamtime_13, durhammean_13, '.')
plot(durhamtime_13,smooth_durham_mean_2013)
xlabel('Time (month)')
ylabel('2.5 Concontration (µg/m^3')
title('Durham, NH PM 2.5 Concontration (µg/m^3)')

smooth_durham_AQI_2013= movmean(durhamAQI_13,7)

figure; clf
hold on
plot(durhamtime_13, durhamAQI_13, '.')
plot(durhamtime_13,smooth_durham_AQI_2013)
xlabel('Time (month)')
ylabel('Air Quality Index')
title('Air Quality Index for Durham, NH')

%% 2018

pm25data_18 = readtable('daily_88101_2018.csv');

% fairlat= 64
% fairlon= -147

%[~,indfairlat] = min(abs(pmlatgrid - fairlat)) 
%[~,indfairlon] = min(abs(pmlongrid - fairlon)) 

%one year sets at Fairbanks, AK- 
% site 10(24 hour data): 5038:5346, 
% site 10(every few days)- 5347:5428 
% site 34 (24 hour data): 5429:5739
% site 34 (every few days): 5740:5803

%everyday data
EVD_FB_site10_mean_18= pm25data_18.ArithmeticMean(5038:5346);
EVD_FB_site10_date_18=pm25data_18.DateLocal(5038:5346);
EVD_FB_site10_AQI_18= pm25data_18.AQI(5038:5346);

EVD_FB_site34_mean_18= pm25data_18.ArithmeticMean(5429:5739);
EVD_FB_site34_date_18=pm25data_18.DateLocal(5429:5739);
EVD_FB_site34_AQI_18= pm25data_18.AQI(5429:5739);

%mean
EVD_smooth_FBsite10_mean_2018= movmean(EVD_FB_site10_mean_18,7);
EVD_smooth_FBsite34_mean_2018= movmean(EVD_FB_site34_mean_18,7);


figure; clf
hold on
plot(EVD_FB_site10_date_18, EVD_FB_site10_mean_18, '.')
plot(EVD_FB_site10_date_18, EVD_smooth_FBsite10_mean_2018)
xlabel('Time (month)')
ylabel('2.5 Concontration (µg/m^3')
title('Fairbanks (Site 10, 24 hour data collection) PM 2.5 Concontration (µg/m^3)')

figure; clf
hold on
plot(EVD_FB_site34_date_18, EVD_FB_site34_mean_18, '.')
plot(EVD_FB_site34_date_18, EVD_smooth_FBsite34_mean_2018)
xlabel('Time (month)')
ylabel('2.5 Concontration (µg/m^3')
title('Fairbanks (Site 34, 24 hour data collection) PM 2.5 Concontration (µg/m^3)')

%AQI
EVD_smooth_FBsite10_AQI_2018= movmean(EVD_FB_site10_AQI_18,7);
EVD_smooth_FBsite34_AQI_2018= movmean(EVD_FB_site34_AQI_18,7);

figure; clf
hold on
plot(EVD_FB_site10_date_18, EVD_FB_site10_AQI_18, '.')
plot(EVD_FB_site10_date_18, EVD_smooth_FBsite10_AQI_2018)
xlabel('Time (month)')
ylabel('Air Quality Index')
title('Air Quality Index for Fairbanks, AK (Site 10, 24 hour data collection)')

figure; clf
hold on
plot(EVD_FB_site34_date_18, EVD_FB_site34_AQI_18, '.')
plot(EVD_FB_site34_date_18, EVD_smooth_FBsite34_AQI_2018)
xlabel('Time (month)')
ylabel('Air Quality Index')
title('Air Quality Index for Fairbanks, AK (Site 34, 24 hour data collection)')

%few days data

FB_site10_mean_18= pm25data_18.ArithmeticMean(5347:5428);
FB_site10_date_18=pm25data_18.DateLocal(5347:5428);
FB_site10_AQI_18= pm25data_18.AQI(5347:5428);

FB_site34_mean_18= pm25data_18.ArithmeticMean(5740:5803);
FB_site34_date_18=pm25data_18.DateLocal(5740:5803);
FB_site34_AQI_18= pm25data_18.AQI(5740:5803);

%mean
smooth_FBsite10_mean_2018= movmean(FB_site10_mean_18,7);
smooth_FBsite34_mean_2018= movmean(FB_site34_mean_18,7);

figure; clf
hold on
plot(FB_site10_date_18, FB_site10_mean_18, '.')
plot(FB_site10_date_18, smooth_FBsite10_mean_2018)
xlabel('Time (month)')
ylabel('2.5 Concontration (µg/meter^3')
title('Fairbanks (Site 10) PM 2.5 Concontration (µg/m^3)')

figure; clf
hold on
plot(FB_site34_date_18, FB_site34_mean_18, '.')
plot(FB_site34_date_18, smooth_FBsite34_mean_2018)
xlabel('Time (month)')
ylabel('2.5 Concontration (µg/meter^3')
title('Fairbanks (Site 34) PM 2.5 Concontration (µg/m^3)')

%AQI
smooth_FBsite10_AQI_2018= movmean(FB_site10_AQI_18,7);
smooth_FBsite34_AQI_2018= movmean(FB_site34_AQI_18,7);

figure; clf
hold on
plot(FB_site10_date_18, FB_site10_AQI_18, '.')
plot(FB_site10_date_18, smooth_FBsite10_AQI_2018)
xlabel('Time (month)')
ylabel('Air Quality Index')
title('Air Quality Index for Fairbanks, AK (Site 10)')

figure; clf
hold on
plot(FB_site34_date_18, FB_site34_AQI_18, '.')
plot(FB_site34_date_18, smooth_FBsite34_AQI_2018)
xlabel('Time (month)')
ylabel('Air Quality Index')
title('Air Quality Index for Fairbanks, AK (Site 34)')


% durhamlat= 43
% durhamlon= -70

%[~,inddurlat] = min(abs(pm25data_2013.Latitude - durhamlat))
%[~,inddurlon]= min(abs(pm25data_2013.Longitude- durhamlon))

%durham ind site 14: 290325:290708... every few days: 290325:290354,
%everyday: 290355:290708

%everyday
EVD_durhammean_18= pm25data_18.ArithmeticMean(290355:290708);
EVD_durhamtime_18=pm25data_18.DateLocal(290355:290708);
EVD_durhamAQI_18= pm25data_18.AQI(290355:290708);

%mean
EVD_smooth_durham_mean_2018= movmean(EVD_durhammean_18,7)

figure; clf
hold on
plot(EVD_durhamtime_18, EVD_durhammean_18, '.')
plot(EVD_durhamtime_18,EVD_smooth_durham_mean_2018)
xlabel('Time (month)')
ylabel('2.5 Concontration (µg/m^3')
title('Durham, NH PM 2.5 Concontration (µg/m^3) (24 hour data collection)')

%AQI
EVD_smooth_durham_AQI_2018= movmean(EVD_durhamAQI_18,7)

figure; clf
hold on
plot(EVD_durhamtime_18, EVD_durhamAQI_18, '.')
plot(EVD_durhamtime_18, EVD_smooth_durham_AQI_2018)
xlabel('Time (month)')
ylabel('Air Quality Index')
title('Air Quality Index for Durham, NH (24 hour data collection)')

%every few days
durhammean_18= pm25data_18.ArithmeticMean(290325:290354);
durhamtime_18=pm25data_18.DateLocal(290325:290354);
durhamAQI_18= pm25data_18.AQI(290325:290354);

%mean
smooth_durham_mean_2018= movmean(durhammean_18,7)

figure; clf
hold on
plot(durhamtime_18, durhammean_18, '.')
plot(durhamtime_18,smooth_durham_mean_2018)
xlabel('Time (month)')
ylabel('2.5 Concontration (µg/m^3')
title('Durham, NH PM 2.5 Concontration (µg/m^3)')

%AQI
smooth_durham_AQI_2018= movmean(durhamAQI_18,7)

figure; clf
hold on
plot(durhamtime_18, durhamAQI_18, '.')
plot(durhamtime_18,smooth_durham_AQI_2018)
xlabel('Time (month)')
ylabel('Air Quality Index')
title('Air Quality Index for Durham, NH')
