function [ fitness, chrom ] = findBest( IP, data )
%Finds best fitness value with the value of the variable 

Fitness = find_fitness_Silhouette(IP, data);
[fitness, ind] = max(Fitness);
% Fitness = find_fitness_DB(IP,data);
% [fitness ,ind] = min (Fitness);
chrom = IP(ind,:);

end

