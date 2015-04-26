function [y]= dec_fx(v,m,f,s)

 x=round(v/(2^(-f)));
 g=ones(1,m);
 p=[];
 r=[];
 rde=[];
 g1=zeros(1,m);
  if s==1
     if x<0
          n=length(dec2bin(x*-1));
          C=de2bi((2^n)+x,n);
       if length(C)>length(g)
             
             for i=f+1:1:length(C)
             r=strcat(dec2bin(C(i)),r);
             end
         
         for i=1:1:f
             rde=strcat(dec2bin(C(i)),rde);
         end
         
        if bin2dec(r)> bi2de(ones(1,(m-f))) && (bin2dec(rde))<= bi2de(ones(1,(f)))
            for i=f+1:1:m
             g(i)=0;
            end
            for i=1:1:f
             g(i)=C(i);
             end
        
        end
        if (bin2dec(rde))<= bi2de(ones(1,(f))) && bin2dec(r)< bi2de(ones(1,(m-f)))
             for i=f+1:1:m
             g(i)=C(i);
             end
             for i=1:1:f
             g(i)=0;
             end
          
           
        end
        
        if (bin2dec(rde))>= bi2de(ones(1,(f))) && (bin2dec(r))>= bi2de(ones(1,(m-f)))
             for i=1:1:length(g)
             g(i)=0;
             end
             
        
            
        end
          
       
       
        for i=1:1:length(g)
        p=strcat(dec2bin(g(i)),p);
        end
        y=strcat('1',p);
        
    
         else
           
            for i=1:1:length(C)
            g(i)=C(i);
            end
            for i=1:1:length(g)
            p=strcat(dec2bin(g(i)),p);
            end
            y=strcat('1',p);
        end    
             
           
    
     else 
         
         n=length(dec2bin(x));
         C=de2bi(x,n);
        
         if length(C)>length(g1)
             
         for i=f+1:1:length(C)
             r=strcat(dec2bin(C(i)),r);
         end
         
         for i=1:1:f
             rde=strcat(dec2bin(C(i)),rde);
         end
         
        if bin2dec(r)> bi2de(ones(1,(m-f))) && bin2dec(rde)< bi2de(ones(1,(f)))
            for i=f+1:1:m
             g1(i)=1;
            end
            for i=1:1:f
             g1(i)=C(i);
             end
        
        else
           if bin2dec(rde)> bi2de(ones(1,(f))) && bin2dec(r)< bi2de(ones(1,(m-f)))
             for i=1:1:f
             g1(i)=1;
             end
             for i=f+1:1:m
             g1(i)=C(i);
            end
           end
           
           
        end
        for i=1:1:length(g1)
            p=strcat(dec2bin(g1(i)),p);
        end
        y=strcat('0',p);
       
        
        else

        for i=length(C):-1:1
            g1(i)=C(i);
        end
        for i=1:1:length(g1)
            p=strcat(dec2bin(g1(i)),p);
        end
          y=strcat('0',p);
        end
     end
  else
         n=length(dec2bin(x));
         C=de2bi(x,n);
        for i=length(g1):-1:1
            g1(i)=C(i);
        end
        for i=1:1:length(g1)
            p=strcat(dec2bin(g1(i)),p);
        end
        y=p;
        
  end
 %utilizar de2bi
 
end 

%NO TOCAR 