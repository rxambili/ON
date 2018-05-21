global nphi;
global ngphi;


disp("-------------------------------------");
nphi = 0;
ngphi = 0;
disp("Test phi1 : delta = 0.5");
newton_non_lineaire(@phi1,@gradphi1,-10,10,eps,100)
disp("Nb d'appel à phi : " + nphi);
disp("Nb d'appel au gradphi : " + ngphi);

disp("-------------------------------------");
nphi = 0;
ngphi = 0;
disp("Test phi21 : delta = 0.2");
newton_non_lineaire(@phi21,@gradphi2,5,100,eps,100)
disp("Nb d'appel à phi : " + nphi);
disp("Nb d'appel au gradphi : " + ngphi);

disp("-------------------------------------");
nphi = 0;
ngphi = 0;
disp("Test phi22 : delta = 0.7");
newton_non_lineaire(@phi22,@gradphi2,38,100,eps,100)
disp("Nb d'appel à phi : " + nphi);
disp("Nb d'appel au gradphi : " + ngphi);


function x = phi1(lambda)
    global nphi;
    nphi = nphi +1;
    x = 4/(lambda+2)^2 + 36/(lambda+14)^2 - 0.5^2;
end

function x = gradphi1(lambda)
    global ngphi;
    ngphi = ngphi +1;
    x = (-8*lambda - 16) / (lambda +2)^4 - (72*lambda + 1008) /(lambda +14)^4;
end


function x = phi21(lambda)
    global nphi;
    nphi = nphi +1;
    x = 1/(4/(lambda-38)^2 + 400/(lambda+20)^2) - 1/0.2^2;
end

function x = phi22(lambda)
    global nphi;
    nphi = nphi +1;
    x = 1/(4/(lambda-38)^2 + 400/(lambda+20)^2) - 1/0.7^2;
end

function x = gradphi2(lambda)
    global ngphi;
    ngphi = ngphi +1;
    x =  ((4*(lambda + 20)^2 + 400*(lambda - 38)^2) * ((2*lambda - 76)*(lambda + 20)^2 + (lambda - 38)^2*(2*lambda + 40)) - (lambda - 38)^2 * (lambda + 20)^2 * (808*lambda - 30240)) / (4*(lambda + 20)^2 + 400*(lambda - 38)^2)^2;
end