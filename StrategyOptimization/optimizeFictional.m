function Return = optimizeFictional(index)

if index == 1 %googl
    Return.upperBound = 99; %96
    Return.lowerBound = 11; %12
    Return.aroonInterval = 21; %20
    Return.takeProfit = 5; %4
    Return.stopLoss = -19; %-19
elseif index == 2 %aapl
    Return.upperBound = 81;
    Return.lowerBound = 36;
    Return.aroonInterval = 21;
    Return.takeProfit = 3;
    Return.stopLoss = -10;
elseif index == 3 %nke
    Return.upperBound = 81;
    Return.lowerBound = 5;
    Return.aroonInterval = 21;
    Return.takeProfit = 1;
    Return.stopLoss = -20;
elseif index == 4 %ADDDF
    Return.upperBound = 96;
    Return.lowerBound = 35;
    Return.aroonInterval = 20;
    Return.takeProfit = 18;
    Return.stopLoss = -4;
end


end