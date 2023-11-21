%% Constants
X = [0 1; 1 0];   %Xgate
Z = [1 0; 0 -1];  %Zgate
Y = 1i * X * Z;   %Ygate
H = (1/sqrt(2)) * (X + Z);  %Hadamard gate


%% Calculation
ket0 = [1;0];
ket1 = [0;1];


%rho = ket2dm(ket1);
plotBlochSphere
ket = ket0;
ket = rotateH(ket, pi);



%% Helper Functions
function rho = ket2dm(ket) % convert ket to density matrix rho
    rho = ket * ket';
end


function lambda = ket2bv(ket) %convert ket to bloch vector
    rho= ket2dm(ket);
    X = [0 1; 1 0];   %Xgate
    Z = [1 0; 0 -1];  %Zgate
    Y = 1i * X * Z;   %Ygate
    
    lambda = [trace(X*rho); trace(Y*rho); trace(Z*rho);];  %(x,y,z) components
end

function plotBlochVect (ket)
    lambda = ket2bv(ket);
    someBV = line ( [0 lambda(1)], [0 lambda(2)], [0 lambda(3)], ... 
        'LineWidth', 2, 'Marker', 'o');
end

%rotate over the y axis Ry matrix
function r = rotateY(ket, angle) 
    for t = 0:(pi/24)*(angle/abs(angle)):angle
        Ry = [cos(t/2) sin(t/2); -sin(t/2) cos(t/2)];
        plotBlochVect( Ry * ket);
        %disp(t);
        pause(0.1);
    end
    r = (Ry * ket);
end

%rotate over the x axis Rx matrix
function r = rotateX(ket, angle) 
    for t = 0:(pi/24)*(angle/abs(angle)):angle
        Rx = [cos(t/2) i*sin(t/2); -i*sin(t/2) cos(t/2)];
        plotBlochVect( Rx * ket);
        %disp(t);
        pause(0.1);
    end
    r = (Rx * ket);
end

%rotate over the z axis Rx matrix
function r = rotateZ(ket, angle) 
    for t = 0:(pi/24)*(angle/abs(angle)):angle
        Rz = [exp(i*t/2) 0; 0 exp(-i*t/2)];
        plotBlochVect( Rz * ket);
        %disp(t);
        pause(0.1);
    end
    r = (Rz * ket);
end


%rotate over the x=y axis RH matrix
function r = rotateH(ket, angle) 
    for t = 0:(pi/24)*(angle/abs(angle)):angle
        Rh = [cos(t/4) sin(t/4); sin(t/4) -cos(t/4)];
        plotBlochVect( Rh * ket);
        %disp(t);
        pause(0.1);
    end
    r = (Rh * ket);
end
