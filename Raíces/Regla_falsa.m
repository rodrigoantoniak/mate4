warning("off")
pkg load symbolic
syms f(x) y(x)
function biseccion(f,xl,xu,tol)
    syms aux
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
    if(MEP<=tol)
        fprintf('Raiz encontrada con una tolerancia maxima de %f:\n\t', tol);
        if(xr>=0)
            fprintf('+');
        end;
        fprintf('%f\n', xr);
    elseif((f(xl)*f(xr)<0) && (f(xu)*f(xr)<0))
        fprintf('Mas de una raiz encontrada. Se intentara nuevamente con:\n');
        fprintf('>> ');
        if(xl>=0)
            fprintf('+');
        end;
        fprintf('%f y ', xl);
        if(xr>=0)
            fprintf('+');
        end;
        fprintf('%f\n>> ', xr);
        if(xr>=0)
            fprintf('+');
        end;
        fprintf('%f y ', xr);
        if(xu>=0)
            fprintf('+');
        end;
        fprintf('%f\n', xu);
        fprintf('\nIntento con ');
        if(xl>=0)
            fprintf('+');
        end;
        fprintf('%f y ', xl);
        if(xr>=0)
            fprintf('+');
        end;
        fprintf('%f\n', xr);
        biseccion(f,xl,xr,tol);
        fprintf('\nIntento con ');
        if(xr>=0)
            fprintf('+');
        end;
        fprintf('%f y ', xr);
        if(xu>=0)
            fprintf('+');
        end;
        fprintf('%f\n', xu);
        biseccion(f,xr,xu,tol);
    else
        fprintf('Raiz no encontrable con estos parametros\n');
    end;
end;
y(x)=input('Ingrese funcion a analizar:');
xi=input('Ingrese limite inferior del intervalo:');
xd=input('Ingrese limite superior del intervalo:');
if((y(xi)==0) || (y(xd)==0))
    fprintf('Raiz encontrada: ');
    if(f(xi)==0)
        if(xi>=0)
            fprintf('+');
        end;
        fprintf('%f\n', xi);
    else
        if(xd>=0)
            fprintf('+');
        end;
        fprintf('%f\n', xd);
    end
else
    erro=input('Ingrese la tolerancia deseada:');
    if(erro<0)
        erro=erro*(-1);
    end;
    biseccion(y,xi,xd,erro);
end;