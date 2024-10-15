function [labelMat] = Lable(chrom,data,numberOfClasses)

dataRows = size(data,1);
lm = zeros(dataRows,numberOfClasses);

for i = 1:dataRows
    row = data(i,:);
    for m = 1:numberOfClasses
        Center = chrom(1,m);  
        x1=data(Center,1);
        y1=data(Center,2);
        z1=data(Center,3);
        
        x2 = row(1,1);
        y2 = row(1,2);
        z2 = row(1,3);
        lm(i,m) = sqrt(((x1-x2).^2)+((y1-y2).^2)+((z1-z2).^2));
    end
end

labelMat = zeros(1,dataRows);
for i = 1:dataRows
    [m(i), labelMat(i)] = min(lm(i,:));
end

end



