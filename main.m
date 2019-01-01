%% Plot profit, calculate correlation matrix
charges = 0.07;
investment = 50000;
StockArray = struct('date', {}, 'open', {}, 'high', {}, 'low', {}, 'close', {}, 'vol', {}, 'oi', {});

name1 = 'googl_2008-2017.txt';
StockArray = addStock(StockArray, name1);

name2 = 'aapl_2008-2017.txt';
StockArray = addStock(StockArray, name2);

name3 = 'nke_2008-2017.txt';
StockArray = addStock(StockArray, name3);

name4 = 'adddf_2008-2017.txt';
StockArray = addStock(StockArray, name4);

% Append missing dates 
calculationStructs = assimilateData(StockArray);
% Apply strategy, Random optimization and get Stocks' Profits
ProfitArrays = getProfits(calculationStructs, investment, charges);
%SumProfits = sumProfits(ProfitArrays);
AvgProfits = avgProfits(ProfitArrays);

figure(1);
plot(calculationStructs(1).date(2:end), cumsum(AvgProfits)*100);
datetick('x', 'yyyy');
xlabel('Date, month');
ylabel('Profit, %');
title('googl, aapl, nke, adddf profit graph');
axis tight;

T = getCorrelationMatrix(ProfitArrays);

figure(2);
uitable('Data',T{:,:},'ColumnName',T.Properties.VariableNames,'RowName',T.Properties.RowNames,'Units', 'Normalized', 'Position',[0, 0, 1, 1]);
