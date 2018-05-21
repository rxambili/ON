

disp("-------------------------------------");
g = [ 0; 0];
H = [7 0; 0 2];
disp("Quadratique 1");
pas_cauchy(g,H,1)

disp("-------------------------------------");
g = [ 6; 2];
H = [7 0; 0 2];
disp("Quadratique 2, delta=0.1");
pas_cauchy(g,H,0.1)

disp("-------------------------------------");
g = [ 6; 2];
H = [7 0; 0 2];
disp("Quadratique 2, delta=1");
pas_cauchy(g,H,1)

disp("-------------------------------------");
g = [ -2; 1];
H = [-2 0; 0 10];
disp("Quadratique 3, delta=3");
pas_cauchy(g,H,3)

disp("-------------------------------------");
g = [ -2; 1];
H = [-2 0; 0 10];
disp("Quadratique 3, delta=2");
pas_cauchy(g,H,2)
