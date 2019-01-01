function ReturnData = avgProfits(ProfitArrays)

ReturnData = sumProfits(ProfitArrays);
ReturnData = ReturnData / (size(ProfitArrays, 2));