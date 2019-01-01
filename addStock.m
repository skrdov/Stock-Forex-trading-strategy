function ReturnData = addStock(Stocks, stockFilename)
Data = getMarketData(stockFilename, 'day');
Data.name = stockFilename;

if(isempty(Stocks))
    Stocks = repmat(Data, 1, 1);
else
    Stocks(end+1) = Data;
end
ReturnData = Stocks;