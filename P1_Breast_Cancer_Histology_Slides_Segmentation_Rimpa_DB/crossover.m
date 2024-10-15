function X = crossover( mat, cp )
%Choose two random chromosomes and create a binary vector of nb bits (mask). Then
%interchange the values of the locations where mask value is 1.

[P, nb] = size(mat);
X = [];

for i = 1:P/2   %Loop runs upto P/2 because two chromosomes are choosen at a time
    t = round(unifrnd(1,P,1,2));    %Randomly generate two numbers between 1 and P (size(IP,1) i.e. population size), 1X2 array
    ch1 = mat(t(1),:);  %Fetching chromosomes
    ch2 = mat(t(2),:);
    if rand<cp
        mask = round(rand(1,nb)); %Creating a binary mask of nb bits        
        for j = 1:nb %Crossover operation
            if mask(j)==1
                tmp = ch1(j);
                ch1(j) = ch2(j);
                ch2(j) = tmp;
            end
        end        
    end
    X = [X;ch1;ch2];
end


end
