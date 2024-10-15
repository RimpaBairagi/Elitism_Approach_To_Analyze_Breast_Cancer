function IP = initialize_pop1( P, nb, data )
%Initializes population P X nb binary matrix.

IP = randi([1,size(data,1)],P,nb);

end
