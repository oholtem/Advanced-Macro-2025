% ==================================================
% Solving the Log-linear Walrasian Equilibrium Model
% This version: 2024-10-21
% Oliver Holtemoeller
% Tested: MATLAB R2024a
%         Octave 10.2
% ==================================================

disp('************************************************');
disp('Walrasian Equilibrium: Linearized System');

close all;
clear all;

disp('');
disp('Numerical solution');
disp('------------------');
alpha_sca = 0.3;
a_sca = 1;
sigma_sca = 1;
varphi_sca = 1;

A_Mat = [ 0, -sigma_sca, 1, -varphi_sca;
          0, 0, 1, alpha_sca;
          1, -1, 0, 0;
          1, 0, 0, alpha_sca-1];
b_vec = [ 0; log(a_sca)+log(1-alpha_sca); 0; log(a_sca)];

Log_x_vec = A_Mat\b_vec;

y_0_sca = exp(Log_x_vec(1));
c_0_sca = exp(Log_x_vec(2));
w_0_sca = exp(Log_x_vec(3));
n_0_sca = exp(Log_x_vec(4));

disp(['w_0 = ', num2str(w_0_sca)]);
disp(['c_0 = ', num2str(c_0_sca)]);
disp(['n_0 = ', num2str(n_0_sca)]);
disp(['y_0 = ', num2str(y_0_sca)]);
disp('');
disp('************************************************');
