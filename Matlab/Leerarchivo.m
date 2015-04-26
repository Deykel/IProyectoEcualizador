function [y]= Leerarchivo()
s=str2double(input('Signo : ','s'));
f=str2double(input('Bits parte decimal : ','s'));
N=str2double(input('Cantidad de datos a leer : ','s'));
nombre=input('Nombre de archivo (con extensión): ','s');

archivo=fopen(nombre,'r');
A=textscan(archivo,'%s\r\n',N);
fclose(archivo);
b=(1000);
for i=1:1:N
    b(i) = fx_dec(A{1}{i},f,s);
end
y=b;