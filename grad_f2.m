
function g=grad_f2(x)
    global ng;
    g=[200*(x(2)-x(1)^2)*(-2*x(1)) + 2*x(1) - 2; 200*(x(2)-x(1)^2)];
    ng = ng + 1;
end