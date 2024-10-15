function [DB] = DB(dataLabels,n,data,numberOfClasses)
 
 %% Computing S(i)
S = zeros(1, numberOfClasses);
for i = 1:numberOfClasses
    T = find(dataLabels==i);
    A = n(i,:);
    Distance = 0;
    for j = 1:length(T)
        X = data(T(j),:);
        sum = 0;
        for k = 1:length(X)
               sum = sum + (X(1,k)-A(1,k)).^2;
        end
        Distance = Distance + sum;
    end
    avgDist = Distance/length(T);
    S(i) = sqrt(avgDist);
end

 %% Computing M(i,j)
M = zeros(numberOfClasses, numberOfClasses);

for i = 1:numberOfClasses
    C1 = n(i,:);
    for j = 1: numberOfClasses
        C2 = n(j,:);
        sum = 0;
        for k = 1:length(C2)
            sum = sum + (C1(1,k)-C2(1,k)).^2;
        end
            M(i,j) = sqrt(sum);
    end   
   
end

R = zeros(numberOfClasses, numberOfClasses);
for i = 1:numberOfClasses
    for j = 1:numberOfClasses
        R(i,j) = (S(i)+S(j))/M(i,j);
    end            
end
        
D = zeros(1, numberOfClasses);
for i = 1:numberOfClasses
    D(i) = -Inf;
    row = R(i,:);
    for j = 1:length(row)
        if(row(j)>D(i) && i~=j)
            D(i) = row(j);
        end
    end
end
        
DB = mean(D);

end

