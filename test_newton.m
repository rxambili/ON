
global nf,
global ng;
global nh;


disp("-------------------------------------");
nf = 0;
ng = 0;
nh = 0;
x011 = [1; 0; 0];
x012 = [10; 3; -2.2];
disp("point de départ x011 pour f1");
newton_local(@f1,@grad_f1,@H_f1,x011,eps,10^-8,100)
disp("Nb d'appel à f : " + nf);
disp("Nb d'appel au gradient : " + ng);
disp("Nb d'appel à la Hessienne : " + nh);


disp("-------------------------------------");
nf = 0;
ng = 0;
nh = 0;
disp("point de départ x012 pour f1");
newton_local(@f1,@grad_f1,@H_f1,x012,eps,10^-8,100);
disp("Nb d'appel à f : " + nf);
disp("Nb d'appel au gradient : " + ng);
disp("Nb d'appel à la Hessienne : " + nh);

x021 = [-1.2; 1];
x022 = [10; 0];
x023 = [0; 1/200 + 1/(10^12)];

disp("-------------------------------------");
nf = 0;
ng = 0;
nh = 0;
disp("point de départ x021 pour f2");
newton_local(@f2,@grad_f2,@H_f2,x021,eps,10^-8,100);
disp("Nb d'appel à f : " + nf);
disp("Nb d'appel au gradient : " + ng);
disp("Nb d'appel à la Hessienne : " + nh);

disp("-------------------------------------");
nf = 0;
ng = 0;
nh = 0;
disp("point de départ x022 pour f2");
newton_local(@f2,@grad_f2,@H_f2,x022,eps,10^-8,100);
disp("Nb d'appel à f : " + nf);
disp("Nb d'appel au gradient : " + ng);
disp("Nb d'appel à la Hessienne : " + nh);

disp("-------------------------------------");
nf = 0;
ng = 0;
nh = 0;
disp("point de départ x023 pour f2");
newton_local(@f2,@grad_f2,@H_f2,x023,eps,10^-8,100);
disp("Nb d'appel à f : " + nf);
disp("Nb d'appel au gradient : " + ng);
disp("Nb d'appel à la Hessienne : " + nh);

