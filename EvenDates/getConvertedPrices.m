function sortedStruct = getConvertedPrices(StockDates, ForexData)
%second argument Array will be changed
MissingIndexes = ismember(StockDates, ForexData.date);
MissingDates = StockDates(~MissingIndexes);

%AfieldNames = fieldnames(ForexData);
oldSize = size(ForexData.date, 1);
newSize = oldSize + size(MissingDates,1);

dataCell = convertStruct2Cellm(ForexData, oldSize, newSize);
dataCell = appendMissingDates(dataCell, oldSize, MissingDates);
%sort by date
ssorted = sortrows(dataCell, 1);
%find zero prices
matsort = cell2mat(ssorted(1:end, 2));
indexesInArray = find(matsort == 0);
%and replace them with previous price in time
ssorted = fillMissingPrices(MissingDates, indexesInArray, ssorted);
%store data in struct
sortedStruct = convertCell2Struct(ssorted, newSize);
sortedStruct.name = ForexData.name;
%disp(size(sortedStruct.price));
%disp(newSize);
