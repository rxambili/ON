function y=f1(x)
    global nf;
    y=2*(x(1)+x(2)+x(3)-3)^2 + (x(1)-x(2))^2 +(x(2)-x(3))^2;
    nf = nf + 1;
end

