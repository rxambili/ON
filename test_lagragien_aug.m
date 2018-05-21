global nf,
global ng;
global nh;


disp("-------------------------------------");
nf = 0;
ng = 0;
nh = 0;
xc11 = [0; 1; 1];
xc12 = [0.5; 1.25; 1];
disp("point de départ xc11 pour f1");
lagrangien_aug(@f1,@grad_f1,@H_f1,@c1, @grad_c1, @H_c1, 1, 1, xc11, 4.5,10^-8,10^-8,10^-8,100,1)
disp("Nb d'appel à f : " + nf);
disp("Nb d'appel au gradient : " + ng);
disp("Nb d'appel à la Hessienne : " + nh);


disp("-------------------------------------");
nf = 0;
ng = 0;
nh = 0;
disp("point de départ xc12 pour f1");
lagrangien_aug(@f1,@grad_f1,@H_f1,@c1, @grad_c1, @H_c1, 1, 1, xc12, 4.5,10^-8,10^-8,10^-8,100,1)
disp("Nb d'appel à f : " + nf);
disp("Nb d'appel au gradient : " + ng);
disp("Nb d'appel à la Hessienne : " + nh);

disp("-------------------------------------");
nf = 0;
ng = 0;
nh = 0;
xc11 = [0; 1; 1];
xc12 = [0.5; 1.25; 1];
disp("point de départ xc11 pour f1");
lagrangien_aug(@f1,@grad_f1,@H_f1,@c1, @grad_c1, @H_c1, 1, 1, xc11, 4.5,10^-8,10^-8,10^-8,100,1)
disp("Nb d'appel à f : " + nf);
disp("Nb d'appel au gradient : " + ng);
disp("Nb d'appel à la Hessienne : " + nh);
