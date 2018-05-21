function r = region_confiance(f,grad_f,H_f,x0,deltaMax,delta0,gamma1,gamma2,n1,n2,tol1,tol2,itermax)
% Méthode des régions de confiance
% param
%   f : fonction à minimiser
%   grad_f : gradient de f
%   H_f : Hessienne de f
%   x0 : point de départ
%   deltaMax : delta maximum
%   delta0 : delta de départ
% return
%   r approximation de la solution du probleme


r=x0;
delta = delta0;
iter=0;
grad_r = grad_f(r);
grad0 = grad;
hess_r = H_f(r);
f_r = f(r);
stagnation_x = false;
stagnation_f = false;
c = sqrt(eps);

while norm(grad)>tol1*(norm(grad0)-c) && not(stagnation_x) && not(stagnation_f) && iter <= itermax
    tmp_r=r;
    tmp_f=f_r;
    
    %résolution du sous-probleme de R.C
    s=pas_cauchy(grad_r,hess_r,delta);
         
    %Evaluations
    f_r_s = f(r+s);
    m_r = f_r - r*norm(grad_r)^2 + grad_r'*hess_r*grad_r*r^2;
    q_s = f_r + grad_r'*s + 0.5*s'*hess_r*s;
    p=(f_r - f_r_s)/(m_r - q_s);
    
    %mise à jour de r et delta
    if (p >= n1)
        r = r + s;
        f_r = f(r);
        grad_r = grad_f(r);
        hess_r = H_f(r);
    end
    
    if (p >= n2)
        delta = min(gamma2*delta, deltaMax);
    elseif (p >= n1)
        % on change pas delta
    else
        delta = gamma1*delta;
    end
    
    %mise a jour critères d'arret
    if (p<n1)
        stagnation_x = norm(r - tmp_r)<=tol2*(norm(tmp_r -c));
        stagnation_f = norm(f_r - tmp_f)<=tol2*(norm(tmp_f -c));
    end
    iter=iter+1;
end