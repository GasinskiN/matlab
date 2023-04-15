% Operations on data from a csv file
% The data in this case is temperature in Poland years 2021 and 2022

clear variables; close all;                    
% get data from csv file
T = readtable("weather_data_Poland.csv");
% convert to timetable
TT = table2timetable(T);
% get year and month from the table
[year, mon, ~] = ymd(TT.date);
% pre-allocate matrices for speed purposes
temp_sr = zeros(12,1);
standardDeviation = zeros(12,1);
for i = 1:12
%     get the standard deviation and mean for each month
    monthsubset = TT(mon == i, :);
    standardDeviation(i) = std(monthsubset.temperature);
    monthsubsetMean = mean(monthsubset.temperature);
    temp_sr(i) = monthsubsetMean;
end

% get yearly means
year2021 = TT(year == 2021,:);
mean2021 = mean(year2021.temperature);

year2022 = TT(year == 2022,:);
mean2022 = mean(year2022.temperature);

% plot the average temperature by month
figure(1)
plot(temp_sr)


% get autocorrelation of temperature by month
figure(2)
kmax = 12;
[rx, tau] = xcorr(temp_sr, temp_sr, kmax)
% plot said autocorrelation
plot(tau, rx)

% make a histogram of the temperature in 
figure(3)
histogram(TT.temperature, 24)


