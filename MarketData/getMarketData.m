function MarketData = getMarketData(reference, type)
types = {'day'; 'minute'; 'tick'};
if(~ismember(type, types))
    error('Incorrect date type');
end

fileId = fopen(reference); 
RawData = textscan(fileId, '%s %s %f %f %f %f %d %d', 'Delimiter', ',', 'Headerlines', 1);
fclose(fileId);

MarketData.date = getDate(RawData{:, 1}, RawData{:, 2}, type);
MarketData.open = cell2mat(RawData(:, 3));
MarketData.high = cell2mat(RawData(:, 4));
MarketData.low = cell2mat(RawData(:, 5));
MarketData.close = cell2mat(RawData(:, 6));

if strcmp(type, 'minute') || strcmp(type, 'tick')
    MarketData.up = cell2mat(RawData(:, 7));
    MarketData.down = cell2mat(RawData(:, 8));
elseif strcmp(type, 'day')
    MarketData.vol = cell2mat(RawData(:, 7));
    MarketData.oi = cell2mat(RawData(:, 8));  
end