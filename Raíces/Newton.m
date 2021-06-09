warning("off")
pkg load symbolic
syms f(x) df(x) aux
f(x)=input('Ingrese funcion a analizar:');
xn=input('Ingrese un valor inicial:');
tol=input('Ingrese la tolerancia deseada:');
if(tol<0)
    tol=tol*(-1);
end;
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

fprintf('Raiz encontrada con una tolerancia maxima de %f:\n\t', tol);
if(xn>=0)
    fprintf('+');
end;
fprintf('%f\n', xn);