function x = phi(lambda,Q,D,delta)
    x = sum(Q^2./(lambda+D)^2) - delta^2;
end