function sortedStruct = convertCell2Struct(ssorted, newSize)
sortedStruct.date = cell2mat(ssorted(1:newSize, 1));
sortedStruct.price = cell2mat(ssorted(1:newSize, 2));
sortedStruct.high = cell2mat(ssorted(1:newSize, 3));
sortedStruct.low = cell2mat(ssorted(1:newSize, 4));
%disp(size(sortedStruct.date));
