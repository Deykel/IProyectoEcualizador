function [y]= fx_dec(v,f,s)

n=length(v);
if s==1
   if v(1)=='1'
    y=(bin2dec((v))-2^(n))*(2^(-f));
   elseif v(1)=='0';
        y=bin2dec((v))*(2^(-f));
   
   end
else    
 y=bin2dec((v))*(2^(-f));
end


end