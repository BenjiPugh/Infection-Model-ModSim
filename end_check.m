function[w] = end_check(I)

w=-1;
for j = 2: length(I)
    
    if ((I(1,j)-I(1,(j-1))<= 0) & (I(1,j)-I(1,(j-1))>= -1)) & (I(1, j-1) < max(I))
        w = j;
        break
        
    end
end
        