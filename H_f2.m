function h=H_f2(x)
    global nh;
    h=[1200*x(1)^2 - 400*x(2) + 2, -400*x(1); -400*x(1), 200];
    nh = nh + 1; 
end
