function lambda = newton_non_lineaire (phi, gradphi, lambdaMin, lambdaMax, tol, itermax) 
% phi : fonction
% gradphi : gradiant de la fonction
% lambdaMin = borne inf de lambda
% lambdaMax = borne max de lambda
% eps : precision

phi_l_min = phi(lambdaMin);
phi_l_max = phi(lambdaMax);
niter = 0;


if (min([abs(phi_l_min), abs(phi_l_max)]) < eps)
    if (abs(phi_l_min) <  abs(phi_l_max) )
        lambda = lambdaMin;
    else
        lambda = lamdaMax;
    end
    
else
    
    lambda_cour = lambdaMax;
    %iteration de newton
    test = false;
    while (not(test) && niter < itermax)
        % calcul de gradphi(lambda)
        phi_cour = phi(lambda_cour);
        gradphi_cour = gradphi(lambda_cour);
        lambda_N = lambda_cour -  phi_cour / gradphi_cour;
        % verifier itéré
        phi_lambda_N = phi(lambda_N);
        if (lambda_N > lambdaMin && lambda_N < lambdaMax && ( abs(phi_lambda_N) < 0.5 * abs(phi_cour)))
            lambda_cour = lambda_N;
        else
            % dichotomie
            lambda_D = (lambdaMin + lambdaMax) / 2;
            phi_lambda_D = phi(lambda_D);
            if(phi_l_min * phi_lambda_D < 0) 
                lambdaMax = lambda_D;
                phi_l_max = phi_lambda_D;
            else
                lambdaMin = lambda_D;
                phi_l_min = phi_lambda_D;
            end
            %maj de grad_phi_cour
            %gradphi_cour = lambda_cour - phi_cour / gradphi_cour;
            % maj de lambda_cour
            lambda_cour = lambda_D;
        end
   
        % maj de test
        test = min([abs(phi_l_min), abs(phi_l_max)]) < tol;
        
        
        niter = niter + 1;
    end
    %fin
    lambda = lambda_cour;
end