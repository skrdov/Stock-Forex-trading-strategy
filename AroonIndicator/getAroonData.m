function ResultPercentages = getAroonData(DataHigh, DataLow, interval)

DaysToExtMax(1,1:length(DataHigh)) = interval;
DaysToExtMin(1,1:length(DataLow)) = interval;

for i=interval+1:length(DataHigh)
    [~, Imax] = max(DataHigh(i-interval+1:i));
    [~, Imin] = min(DataLow(i-interval+1:i));
    DaysToExtMax(i) = interval - Imax(1);
    DaysToExtMin(i) = interval - Imin(1);
end

ResultPercentages.max = 100*(interval - DaysToExtMax)/interval;
ResultPercentages.min = 100*(interval - DaysToExtMin)/interval;
