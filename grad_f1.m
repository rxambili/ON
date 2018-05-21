function g=grad_f1(x)
    global ng;
    g=[6*x(1)+2*x(2)+4*x(3)-12; 2*x(1)+8*x(2)+2*x(3)-12; 4*x(1)+2*x(2)+6*x(3)-12];
    ng = ng + 1;
end