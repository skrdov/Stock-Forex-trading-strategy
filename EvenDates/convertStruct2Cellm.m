function NewCell = convertStruct2Cellm(ForexData, oldSize, newSize)

NewCell = cell(newSize, 4);

NewCell(1:oldSize,1) = num2cell(ForexData.date);
NewCell(1:oldSize,2) = num2cell(ForexData.price);
NewCell(1:oldSize,3) = num2cell(ForexData.high);
NewCell(1:oldSize,4) = num2cell(ForexData.low);
