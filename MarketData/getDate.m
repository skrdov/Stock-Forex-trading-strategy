function Date = getDate(RawDate, RawTime, type)


DateString = cell2mat(RawDate);
DateHour = cell2mat(RawTime);

year = DateString(:,7:10);
month = DateString(:,1:2);
day = DateString(:,4:5);
hour = '0';
min = '0';
if strcmp(type, 'minute') || strcmp(type, 'tick')
    hour = DateHour(:,1:2);
    min = DateHour(:,4:5);
end
sec = '0';
if strcmp(type, 'tick')%numel(DateHour(1:1,1:end)) == 8
sec = DateHour(:,7:8);
end
Date =  datenum(str2num(year), str2num(month), str2num(day), str2num(hour), str2num(min), str2num(sec));