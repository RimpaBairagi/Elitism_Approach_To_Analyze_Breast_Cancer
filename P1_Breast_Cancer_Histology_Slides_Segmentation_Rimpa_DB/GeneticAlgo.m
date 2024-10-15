function [ bestFitness, chrom ] = GeneticAlgo( P, G, cp, mp, nb, data)

IP = initialize_pop(P,nb,data);     %Initializing population (a P X nb binary matrix)

bst = zeros(1,G); %Optional step. Preallocation for speed
avg = zeros(1,G);
for i = 1:G
  i  
   % Fitness = find_fitness_DB(IP,data);   %Computing fitness of P number of chromosomes according to the function given.
    Fitness = find_fitness_Silhouette(IP,data);

    bst(i) = max(Fitness);  %Optional step. Computes best and average fitness value of each generation.
    %bst(i)= min (Fitness);
    avg(i) = mean(Fitness); %Optional step. Computes best and average fitness value of each generation.

    [bestFitness,chrom] = findBest(IP, data); %For Elitism

    mat = selection(IP,Fitness);    %Randomly choose two chromosomes and retains the best by comparing their fitness
    X = crossover(mat,cp);          %Crossover is performed over selected chromosomes depending on cp
    IP = mutation(X,mp,data);       %Mutation is performed after crossover depending on mp

    IP(P,:) = chrom;                %For Elitism
end

[bestFitness, chrom] = findBest(IP, data);      %Finds best fitness value with the value of the variable

figure,plot(bst), title('Convergence Curve'), xlabel('Generations'), ylabel('Silhouette Index'),hold all, figure,plot(avg);    %Optional step. Plots best and average values
end



 
