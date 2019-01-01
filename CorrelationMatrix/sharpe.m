function result = sharpe(ProfitPercentage)

result = (mean(ProfitPercentage)*252) ./ (std(ProfitPercentage) * sqrt(252));