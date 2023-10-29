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

plotBlochVect( H * ket0);


%%Helper Functions
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
