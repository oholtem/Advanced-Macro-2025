// Ramsey Model with Distortionary Taxation
// Original Version: George Alogoskoufis
// https://mitpress.mit.edu/9780262043014/dynamic-macroeconomics/
//
// Modified and tested on Dynare 5.2
//
// We study an increase in the tax rate on income from capital tk
// and an increase in the tax rate on business profits tf
// 
// 1. The interest tax rate tk is increased from 0 to 10%
// 2. The profit tax rate tf is increased from 0 to 10%

% ----------------------------------------------------------------------------- %
% Adjusted by Alexandra Gutsch on 24/01/2026 for problem set 12

// Definition of Variables
var y k c w r s gy rnet;
varexo Z tk tf;

// Definition of Parameters
parameters alpha delta n a rho sigma;

alpha=0.333;
delta=0.03;
n=0.01;
a=0.02;
rho=0.02;
sigma=1; % we will vary the inverse IES

model;
// Production function
y=Z*(k(-1)^alpha);
// Profit-maximizing condition for capital:
r=(1-tf)*((alpha*Z*k(-1)^(alpha-1))-delta);
// Consumption Euler equation 
c(+1)=((((1+(r*(1-tk)))/(1+(rho)))^(1/sigma))*(1/(1+a)))*c;
// Capital accumulation
k=(1/((1+n)*(1+a)))*((y-c)+(1-delta)*k(-1));
// Competitive wage
w=(1-alpha)*Z*k(-1)^(alpha);
// Savings rate
s=(y-c)/y;
// Output growth rate
gy=(y-y(-1))/y(-1);
// Net real interest rate
rnet = (1-tf)*(1-tk)*r;

end;

initval;

k=5.3;
c=1.38;
y=1.7;
Z=1;
r=0.075;
w=1.16;
tf=0;
tk=0;

end;

steady;

endval;

k=5.3;
c=1.38;
y=1.7;
Z=1;
r=0.075;
w=1.16;
tf=0.10;
tk=0.0;

end;

% ----------------------------------------------------------------------------- %
% Loop for simulating the model with different values of sigma

sigma_vec = [0.5, 1, 1.5]; % define vector with different values of sigma

% Initialize structures to hold IRFs for each variable
ts = struct();

for ii = 1:length(sigma_vec) % iterate over all elements in sigma_vec
    sigma = sigma_vec(ii); % sigma = certain value in every loop iteration
    disp(['sigma = ', num2str(sigma)]); % optionally to track iterations

    steady; % calculate steady state with current value of sigma
    
    % perfect foresight simulation with current value of sigma
    perfect_foresight_setup(periods=100);
    perfect_foresight_solver;
    send_endogenous_variables_to_workspace;
 
    % save time paths for current value of sigma in structure
    ts.k{ii} = k;
    ts.y{ii} = y;
    ts.c{ii} = c;
    ts.rnet{ii} = rnet;
    ts.r{ii} = r;
    ts.s{ii} = s;
    ts.w{ii} = w;
    ts.gy{ii} = gy;
end

% save time paths for every value of sigma in single vectors
for ii = 1:length(sigma_vec)
    eval(['ts.k_sigma' num2str(ii) ' = ts.k{ii};']); 
    eval(['ts.y_sigma' num2str(ii) ' = ts.y{ii};']); 
    eval(['ts.c_sigma' num2str(ii) ' = ts.c{ii};']); 
    eval(['ts.rnet_sigma' num2str(ii) ' = ts.rnet{ii};']); 
    eval(['ts.r_sigma' num2str(ii) ' = ts.r{ii};']); 
    eval(['ts.s_sigma' num2str(ii) ' = ts.s{ii};']); 
    eval(['ts.w_sigma' num2str(ii) ' = ts.w{ii};']); 
    eval(['ts.gy_sigma' num2str(ii) ' = ts.gy{ii};']); 
end;  

