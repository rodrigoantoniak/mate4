% Metodo de Regla Falsa.
warning("off")
pkg load symbolic
syms f(x) aux
f(x)=input('Ingrese funcion a analizar:');
xl=input('Ingrese limite inferior del intervalo:');
xu=input('Ingrese limite superior del intervalo:');
tol=input('Ingrese la tolerancia deseada:');
xr=0;
n=0;
MEP=0;
fprintf(' n       xl          xr          xu         MEP\n');

do
    aux=xu-((xu-xl)*f(xu)/(f(xu)-f(xl)));
    xr=double(aux);
    aux=f(xr);
    if(aux>=0)
        MEP=double(aux);
    else
        MEP=double(aux)*(-1);
    end;
    fprintf('%02d   ', n);
    if(xl>=0)
        fprintf('+');
    end;
    fprintf('%f   ', xl);
    if(xr>=0)
        fprintf('+');
    end;
    fprintf('%f   ', xr);
    if(xu>=0)
        fprintf('+');
    end;
    fprintf('%f   %f\n', xu, MEP);
    if((f(xl)*f(xr)<0) && (f(xu)*f(xr)>0))
        xu=xr;
    elseif((f(xl)*f(xr)>0) && (f(xu)*f(xr)<0))
        xl=xr;
    else
        break;
    end;
    n=n+1;
until(MEP<=tol);

if((f(xl)==0) || (f(xu)==0))
    fprintf('Raiz encontrada: ');
    if(f(xl)==0)
        fprintf('%f\n', xl);
    else
        fprintf('%f\n', xu);
    end
elseif(MEP<=tol)
    fprintf('Raiz encontrada con una tolerancia de %f:\n\t%f\n', MEP, xr);
elseif((f(xl)*f(xr)<0) && (f(xu)*f(xr)<0))
    fprintf('Mas de una raiz encontrada. Intente nuevamente con:\n');
    fprintf('>> %f y %f\n', xl, xr);
    fprintf('>> %f y %f\n', xr, xu);
else
    fprintf('Raiz no encontrable con estos parametros\n');
end;
