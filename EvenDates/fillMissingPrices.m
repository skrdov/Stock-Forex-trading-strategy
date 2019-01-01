function sortedd = fillMissingPrices(MissingDates, indexesInArray, sorted)
 
 sortedd = sorted;
 dataa = cell2mat(sorted(:,2));
 dataHigh = cell2mat(sorted(:,3));
 dataLow = cell2mat(sorted(:,4));
 
 dataaa = interp1(1:nnz(dataa), dataa(dataa ~= 0), cumsum(dataa ~= 0), 'NearestNeighbour');
 dataHighH = interp1(1:nnz(dataHigh), dataHigh(dataHigh ~= 0), cumsum(dataHigh ~= 0), 'NearestNeighbour');
 dataLowL = interp1(1:nnz(dataLow), dataLow(dataLow ~= 0), cumsum(dataLow ~= 0), 'NearestNeighbour');
 
 sortedd(1:end,2) = num2cell(dataaa);
 sortedd(1:end,3) = num2cell(dataHighH);
 sortedd(1:end,4) = num2cell(dataLowL);
 
%for j = 1:size(MissingDates,1)
%    sortedd{indexesInArray(j), 2} = sortedd{indexesInArray(j)-1, 2};
%end

