function [SC ] = Silhouette( dataLabels,data,numberOfClasses )
%% Computing a() for each data point
a = zeros(1,size(data,1));     
dataRowNos = size(data,1);

for i = 1:dataRowNos
    l = dataLabels(i);
    channels = data(i,:);
    pointsInCluster = find(dataLabels==l);
    Distance=0;
    for j = 1:length(pointsInCluster)
        clusterMemberChannels = data(pointsInCluster(j),:);
        sum = 0;
        for k = 1:length(clusterMemberChannels)
            sum = sum+(clusterMemberChannels(1,k)-channels(1,k)).^2;           
        end
        Distance = Distance+sqrt(sum);
    end
    a(i) = Distance/(length(pointsInCluster)-1 );
end
 
%% Computing b() for each data point    
b = zeros(1,size(data,1)); 

for i = 1:dataRowNos
    l = dataLabels(i);
    channels = data(i,:);
    temp = zeros(1,numberOfClasses-1);
    index = 0;
    for j = 1:numberOfClasses
        if(j~=l)                   
            Distance = 0;
            pointsInCluster = find(dataLabels==j); 
            for k = 1:length(pointsInCluster)
                clusterMemberChannels = data(pointsInCluster(k),:);
                sum = 0;
                for w = 1:length(clusterMemberChannels)
                    sum = sum + (clusterMemberChannels(1,w)-channels(1,w)).^2;
                end
                Distance = Distance + sqrt(sum);
            end
            index  = index + 1;
            temp(index)= Distance / length(pointsInCluster);                                   
        end
    end
    b(i) = min(temp);
end

%% Computing Silhouette value for each data point         
s = zeros(1,size(data,1)); 
       
for i = 1:size(data,1)
    s(i) = (b(i)-a(i))/max(a(i),b(i));
end

sk = zeros(1,numberOfClasses);

for i = 1:numberOfClasses
    pointsInCluster=find(dataLabels==i);
    sk(i) = mean(s(pointsInCluster));
end

SC = max(sk);


end

