function s = pas_cauchy(g,h,delta)
% pas de cauchy
% param
%   g : gradient courante
%   h : hessienne courante
%   delta : le delta courant
% return
%   s solution aprox du sous problème


cond = g'*h*g;
norm_g = norm(g);

if (g == 0)
    s = 0;
else
    if (cond > 0)
        t = min(delta/norm_g,norm_g^2/cond);
    else
        t = delta/norm_g;
    end
    s = -t*g;
end
