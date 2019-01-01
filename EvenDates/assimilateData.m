function StructArray = assimilateData(StockArray)

Dmns.date = StockArray(1).date;
Dmns.price = StockArray(1).close;
Dmns.high = StockArray(1).high;
Dmns.low = StockArray(1).low;
Dmns.name = StockArray(1).name;
DmnsArray = repmat(Dmns, 1, 3);

for i=1:size(StockArray, 2)
    DmnsArray(i).date = StockArray(i).date;
    DmnsArray(i).price = StockArray(i).close;
    DmnsArray(i).high = StockArray(i).high;
    DmnsArray(i).low = StockArray(i).low;
    DmnsArray(i).name = StockArray(i).name;
end

for i=1:size(DmnsArray, 2)-1
    for j=i+1:size(DmnsArray, 2)
        DmnsArray(i) = getConvertedPrices(DmnsArray(j).date, DmnsArray(i));
        DmnsArray(j) = getConvertedPrices(DmnsArray(i).date, DmnsArray(j));
    end
end

StructArray = DmnsArray;