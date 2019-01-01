function [Income, SellStra, BuyStra, SellLoss, SellProfit] = strategyOneOne(Prices, Aroon, interval, cash, upperBound, lowerBound, charges, takeProfit, stopLoss)
investment = cash;
lastPurchaseIndex = -1;
stocks = 0;
Income = zeros([1 length(Prices)]);

SellStra(1:length(Prices)) = investment;%zeros([1 length(Prices)]);
BuyStra(1:length(Prices)) = investment;
SellLoss(1:length(Prices)) = investment;
SellProfit(1:length(Prices)) = investment;

Income(1:interval+1) = cash;
i = interval+1;
while i <= length(Prices)
    %Stop Loss
    if(lastPurchaseIndex ~= -1 && stocks > 0 && Prices(i) - Prices(lastPurchaseIndex) < stopLoss)
        cash = cash + (stocks * Prices(i)) - (stocks * charges);
        stocks = 0;
        SellLoss(i) = cash;
        lastPurchaseIndex = -1;
    %Take Profit
    elseif(lastPurchaseIndex ~= -1 && stocks > 0 && Prices(i) - Prices(lastPurchaseIndex) > takeProfit)
        cash = cash + (stocks * Prices(i)) - (stocks * charges);
        stocks = 0;
        SellProfit(i) = cash;
        lastPurchaseIndex = -1;
    %Strategy sell
    elseif Aroon.max(i) > upperBound && Aroon.min(i) < lowerBound && stocks > 0
        cash = cash + (stocks * Prices(i)) - (stocks * charges);
        stocks = 0;
        SellStra(i) = cash;
        lastPurchaseIndex = -1;
    %Strategy buy
    elseif Aroon.min(i) > upperBound && Aroon.max(i) < lowerBound && floor((cash - charges) / Prices(i)) > 0 %% && cash > 0  && Prices(i) < takeProfit && Prices(i) > stopLoss%%&& (cash - Prices(i) * 100) > 0 
        stocksToPurchase = floor((cash - charges) / Prices(i));
        stocks = stocks + stocksToPurchase;
        cash = cash - (stocksToPurchase * Prices(i)) - (stocks * charges); 
        BuyStra(i) = cash + (stocks * Prices(i));
        lastPurchaseIndex = i;       
    end
    Income(i) = cash + (stocks * Prices(i)) - (stocks * charges);
    i = i + 1;
end


SellStra = SellStra - investment;
BuyStra = BuyStra - investment;
SellLoss = SellLoss - investment;
SellProfit = SellProfit - investment;