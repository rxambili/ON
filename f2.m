function y=f2(x)
    global nf;
    y=100*(x(2)-x(1)^2)^2 + (1-x(1))^2;
    nf = nf +1;
end;


