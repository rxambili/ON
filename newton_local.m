function r = newton_local(f,grad_f,H_f,x0,tol1,tol2,itermax)
% Calcul du newton local de f
% param
%   f : fonction à minimiser
%   grad_f : gradient de f
%   H_f : Hessienne de f
%   x0 : point de départ
%   tol1 : tolerance de convergence sur le gradient
%   tol2 : tolerance de stagnation de x
%   itermax : nombre d'itération max
% return
%   r aproximation du résultat de minimisation

r=x0;
iter=0;
grad = grad_f(r);
grad0 = grad;
stagnation = false;
c = sqrt(eps);
while  norm(grad)>tol1*(norm(grad0)-c) && not(stagnation) && iter <= itermax
    tmp=r;
    r=r-H_f(r)\grad;
    grad = grad_f(r);
    %diff_f = f(r) - f(tmp);
    stagnation = norm(r - tmp)<=tol2*(norm(tmp -c));
    iter=iter+1;
end
%if norm(grad)<=tol1*(norm(grad0)-c)
%    disp("Aproximation trouvée");
%    disp(r);
%    disp("nb d'itérations : " + iter);
%elseif stagnation
%    disp("Stagnation");
%    disp(r);
%    disp("nb d'itérations : " + iter);
%else
%    disp("Maximum d'itération atteint");
%    disp(r);
%    disp("nb d'itérations : " + iter);
%end;