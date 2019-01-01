function ReturnData = sumProfits(ProfitArrays)

ReturnData = zeros([1 length(ProfitArrays(1).profit)]);
for i=1:size(ProfitArrays, 2)
    ReturnData = ReturnData + ProfitArrays(i).profit;
end