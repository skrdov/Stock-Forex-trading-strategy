function cell = appendMissingDates(cell, oldSize, MissingDates)
newItemIndex= oldSize+1;

aa = oldSize + length(MissingDates);
cell(newItemIndex:aa, 1) = num2cell(MissingDates);
cell(newItemIndex:aa, 2) = num2cell(0);
cell(newItemIndex:aa, 3) = num2cell(0);
cell(newItemIndex:aa, 4) = num2cell(0);
%for i = 1:size(MissingDates,1)
%    cell{newItemIndex, 1} = MissingDates(i);
%    cell{newItemIndex, 2} = 0;
%    newItemIndex = newItemIndex + 1;
%end