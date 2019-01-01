function returnData = optimiseParamsRnd(Data, investment, charges)
%arronFirstInterval = 20;
%arronLastInterval = 30;
valueExist = false;

for e=1:10000
    if mod(e,500) == 0
        disp(e);
    end
            z = randi(20);
            s = randi(20)*(-1);
            k = randi(10)+19;
            i = randi(40);
            j = randi(40)+60;
            AroonData = getAroonData(Data.high, Data.low, k);
            [Income, ~, ~, ~, ~] = strategyOneOne(Data.price, AroonData, k, investment, j, i, charges, z, s);
            Change = diff(Income) ./ Income(1:end-1);
            if (~valueExist) || (sharpe(Change) > sharpe(maxVal))
                %disp(val);
                maxVal = Change;%val;
                maxI = i
                maxJ = j
                bestAroon = k
                takeP = z
                stopL = s
                valueExist = true;
                sharpe(Change)
            end
end
returnData.maxProfit = maxVal;
returnData.upperBound = maxJ;
returnData.lowerBound = maxI;
returnData.aroonInterval = bestAroon;
returnData.takeProfit = takeP;
returnData.stopLoss = stopL;