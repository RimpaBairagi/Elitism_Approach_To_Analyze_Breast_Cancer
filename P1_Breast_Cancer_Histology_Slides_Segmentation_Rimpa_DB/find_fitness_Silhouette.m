function Fitness = find_fitness_Silhouette( IP,data )
%Finds fitness of each chromosome

dataRowNos = size(data,1);
IPCols = size(IP,2);
IPRows = size(IP,1);

lm = zeros(dataRowNos,IPCols);
Fitness = zeros(1,IPRows);
dataLabels = zeros(1,dataRowNos);

for i = 1:IPRows
    for j = 1:IPCols
        C = IP(i,j);    %Extracting a center point 
        
        %Selecting corresponding pixel values
        x1 = data(C,1);
        y1 = data(C,2);
        z1 = data(C,3);

        for k = 1:dataRowNos
            x2 = data(k,1);
            y2 = data(k,2);
            z2 = data(k,3);
            lm(k,j) = sqrt(((x1-x2).^2)+((y1-y2).^2)+((z1-z2).^2));
         end
    end
    for l = 1:dataRowNos
        [~, dataLabels(l)] = min(lm(l,:));
    end

     Fitness(i) = Silhouette(dataLabels,data,IPCols);
    
end

end