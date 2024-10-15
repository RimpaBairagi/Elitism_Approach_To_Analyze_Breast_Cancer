function mat = selection( IP, Fitness )
%Randomly choose two chromosomes and retains the best by comparing their fitness

mat = zeros(size(IP,1),size(IP,2)); %Optional step. Preallocation for speed
for i = 1:size(IP,1)
    t = round(unifrnd(1,size(IP,1),1,2)); %Randomly generate two numbers between 1 and P (size(IP,1) i.e. population size), 1X2 array
    if(Fitness(t(1))>Fitness(t(2)))    %Comparing fitness of two chromosomes. Remember t holds the row index
        mat(i,:) = IP(t(1),:);
    else
        mat(i,:) = IP(t(2),:);
    end
end
end