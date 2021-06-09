% Metodo de Newton.
warning("off")
pkg load symbolic
syms f(x) df(x) aux
f(x)=input('Ingrese funcion a analizar:');
xn=input('Ingrese un valor inicial:');
tol=input('Ingrese la tolerancia deseada:');
df=diff(f,x);
MEP=0;
n=0;
fprintf(' n       xn         MEP\n');

do
    aux=f(xn)/df(xn);
    if(aux>=0)
        MEP=double(aux);
    else
        MEP=double(aux)*(-1);
    end;
    fprintf('%02d   ', n);
    if(xn>=0)
        fprintf('+');
    end;
    fprintf('%f   %f\n', xn, MEP);
    n=n+1;
    aux=xn-(f(xn)/df(xn));
    xn=double(aux);
until(MEP<=tol);

fprintf('Raiz encontrada con una tolerancia de %f:\n\t%f\n', tol, xn);
