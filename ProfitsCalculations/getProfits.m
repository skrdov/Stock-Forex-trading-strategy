function ReturnData = getProfits(calculationStructs, investment, charges)

DataExm.profit = calculationStructs(1).price;
DataExm.profit = calculationStructs(1).name;
ProfitArrays = repmat(DataExm, 1, size(calculationStructs, 2));

for i=1:size(calculationStructs, 2)
    %optimizedParams = optimiseParamsRnd(calculationStructs(i), investment, charges);
    optimizedParams = optimizeFictional(i);
    aroonData = getAroonData(calculationStructs(i).high, calculationStructs(i).low, optimizedParams.aroonInterval);
    [Income, ~, ~, ~, ~] = strategyOneOne(calculationStructs(i).price, aroonData, optimizedParams.aroonInterval, investment, optimizedParams.upperBound, optimizedParams.lowerBound, charges, optimizedParams.takeProfit, optimizedParams.stopLoss);
    ProfitArrays(i).profit = diff(Income) ./ Income(1:end-1); %(Income-investment)/investment;%
    ProfitArrays(i).name = calculationStructs(i).name;
end

ReturnData = ProfitArrays;
