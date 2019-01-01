function ReturnData = getCorrelationMatrix(ProfitArrays)
sample = zeros(size(ProfitArrays, 2));%rand(3,3);

for i=1:size(ProfitArrays, 2)
    rowNames(i,:) = cellstr(matlab.lang.makeValidName(ProfitArrays(i).name));
    colNames(i,:) = cellstr(matlab.lang.makeValidName(ProfitArrays(i).name));
end

sample(logical(eye(size(ProfitArrays, 2)))) = 1;
for i=1:size(ProfitArrays, 2)-1
    for j=i+1:size(ProfitArrays, 2)
        sample(i,j) = getCorrelationCoef(ProfitArrays(i).profit, ProfitArrays(j).profit);
        sample(j,i) = getCorrelationCoef(ProfitArrays(i).profit, ProfitArrays(j).profit);
    end
end
ReturnData = array2table(sample,'RowNames',rowNames,'VariableNames',colNames);