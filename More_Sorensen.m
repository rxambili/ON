function [s,lambda] = More_Sorensen(g,H,delta,itermax)
    
    % décomposition spectrale de H
    [Q,D] = eig(H);

    % recherche solution intérieure
    s_N = H\g;
    if (D(1) >= 0 && norm(s_N,2) <= delta)
        s = s_N;
        lambda = 0;
    else
        % Recherche d'une solution sur la frontière
        if (Q(1)'*g ~= 0)
            % recherche lambdaMin et lambdaMax
            
            % resolution de l'équation non linéaire en lambda
            lambda = newton_non_lineaire(@(lambda)phi(lambda,Q,D,delta),@(lambda)gradphi(lambda,Q,D),lambdaMin,lambdaMax,eps,itermax);
            s = -sum(Q'*g*Q./(D+lambda));
        else
            % norme du vecteur
            s = -sum(Q(2:length(Q))'*g*Q(2:length(Q))./(D(2:length(Q))+D(1)));
            if ()
                
            else
                
            end            
        end
    end        
end