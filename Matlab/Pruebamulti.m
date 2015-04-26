function [l]=Pruebamulti()
%TERMINOS RANDOM DE PRUEBA

x=randn(1,1000);
y=randn(1,1000);

%x= randi(100,1,1000);
%y= randi(100,1,1000);

%multiplicacion normal matlab
multi=(1000);
for i=1:length(y)
    multi(i)=(y(i)*x(i));
end


m={1000};

%conversión a punto fijo de multiplicacion 
for i=1:1:1000
    p='';
   salida=dec_fx(multi(i),24,16,1); 
    for n=1:1:25
     p=strcat(p,num2str(salida(n)));
    end 
   m{i}=p;
end

%conversión a decimal desde punto fijo  
h=(1000);
for c=1:length(m)
    h(c)=fx_dec(m{c},16,1); 
end

l=h;

subplot(4,1,1), plot(multi); % graficación de multiplicación normal matlab
subplot(4,1,2), plot(h); % multiplicación total simulacion salida xilinx 


%guarda datos x
fid=fopen('Datosx.txt','w');
fid1=fopen('Datosy.txt','w');
for i=1:length(x)
  fprintf(fid,'%s\r\n',dec_fx(x(i),24,16,1));
   fprintf(fid1,'%s\r\n',dec_fx(y(i),24,16,1));
end
fclose(fid);
fclose(fid1);
%guarda datos y






