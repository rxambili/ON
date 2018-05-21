function [x,lambda,mu] = lagrangien_aug(f, grad_f, H_f, c, grad_c, H_c, mu0, tau, x0, lambda0, tol1, tol2, tol3, iterMax, solveur)

%init
etaChapeau = 0.1258925;

alpha = 0.1;
beta = 0.9;
epsilon0 = 1/mu0;
eta = etaChapeau/(mu0)^alpha;

epsilon = epsilon0;
lambda = lambda0;
mu = mu0;
x = x0;

k = 0;
cn1 = false;
stagnation = false;
arret = false;

while (not(arret)) 
    % minimiseur du lagrangien
    x_prec = x;
    if (solveur == 1) %Newton
        x = newton_local(@(x)La(f,c, x,lambda,mu), @(x)grad_La(grad_f, grad_c, c, x, lambda, mu), @(x)H_La(H_f, H_c, grad_c, c, x, lambda, mu), x, tol1, tol3, iterMax)
    elseif (solveur == 2) %Region de confiance pas de cauchy
        x = region_confiance(@(x)La(f,c, x,lambda,mu),@(x)grad_La(grad_f, grad_c, c, x, lambda, mu),@(x)H_La(H_f, H_c, grad_c, c, x, lambda, mu),x,deltaMax,delta0,gamma1,gamma2,n1,n2,tol1,tol3,iterMax)
    end
    
    % Test de convergence
    cn1 = norm(grad_La(grad_f, grad_c, c, x, lambda, mu)) <= tol1 &&  norm(c(x)) <= tol2; 
    stagnation = norm(x - x_prec) <= tol3 && norm(c(x)) <= tol2;
    arret = cn1 || stagnation || k > iterMax;
    
    if (not(arret))
         % mise a jour des multiplicateurs
        if (norm(c(x)) <= eta)
            lambda = lambda + mu*c(x);
            epsilon = epsilon/mu;
            eta = eta/mu^beta;
            k= k+1;
        else 
            mu = tau*mu;
            epsilon = epsilon0/mu;
            eta = etaChapeau/mu^alpha;
            k= k+1;            
        end
    end
end
end


function y = La(f, c, x,lambda, mu)
    y =f(x) + lambda' * c(x) + (mu/2) * norm(c)^2;
end

function y = grad_La(grad_f, grad_c, c, x,lambda, mu)
    y = grad_f(x) + grad_c(x)' * lambda + mu * grad_c(x)' * c(x);
end

function y = H_La(H_f, H_c, grad_c, c, x,lambda, mu)
    y = H_f(x) + mu * grad_c(x)' * grad_c(x);
    Cx = c(x);
    for i=1:length(Cx)
        y = y + lambda(i) * H_c(i,x) + mu * Cx(i) * H_c(i,x);
    end
end