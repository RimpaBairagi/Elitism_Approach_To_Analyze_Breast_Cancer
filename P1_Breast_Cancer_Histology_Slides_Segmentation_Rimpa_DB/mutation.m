function IP = mutation( X, mp, data )
%For each chromosome, every bits are checked depending on mp

[P, nb] = size(X);

IP = zeros(P,nb);   %Optional step.  Preallocation for speed
for i = 1:P
    for j = 1:nb
        if rand<mp
            IP(i,j) = mod((1+X(i,j)), size(data,1)); %Changing bits
            if(IP(i,j)==0)
                IP(i,j) = 1;
            end
        else
            IP(i,j) = X(i,j);
        end
    end
end
end
