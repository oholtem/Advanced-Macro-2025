% ========================================================
% example_taylor:
% Plot Taylor Approximation of ln(1+x)
% This version: 13.10.2024
% Author: Oliver Holtemoeller
% Tested: Matlab R2024a, Octave 6.4
% ========================================================

close all;
clear all;

% Specify what is to be done
% --------------------------
PlotTaylor  = 1;
DoSavePlots = 0;

% Some useful defintions
% ----------------------
fig_counter = 0;

% Colorblind barrier-free color pallet
BfBlack        = [   0,   0,   0 ]/255;
BfOrange       = [ 230, 159,   0 ]/255;
BfSkyBlue      = [  86, 180, 233 ]/255;
BfBluishGreen  = [   0, 158, 115 ]/255;
BfYellow       = [ 240, 228,  66 ]/255;
BfBlue         = [   0, 114, 178 ]/255;
BfVermillon    = [ 213,  94,   0 ]/255;
BfRedishPurple = [ 204, 121, 167 ]/255;

% Line Properties
StdLineWidth = 2;

% Define interval with values   % Exact formula f(x) = ln(1+1)
% ---------------------------
x = -0.5:0.01:0.5;
y = log(1+x);

% Taylor approximation of order 1
y1 = x;

% Taylor approximation of order 2
y2 = x-((x.^2)/2);

% Plot data
% ---------
if PlotTaylor,
    fig_counter = fig_counter + 1;
    hf = figure(fig_counter);
    hold on;
    plot(x, y, 'color', BfBlue, 'LineWidth', StdLineWidth);
    xlabel('x', 'fontsize', 16);
    ylabel('f(x)', 'fontsize', 16);
    xlim([-0.5, 0.5]);
    text(-0.4,-0.6, 'ln(1+x)', 'fontsize', 16);
    
    if DoSavePlots == 1,
      saveas(hf, '../../figures/fig_TaylorApproximation_1.png', 'png');
    end;
    
    fig_counter = fig_counter + 1;
    hf = figure(fig_counter);
    hold on;
    plot(x, y, 'color', BfBlue, 'LineWidth', StdLineWidth);
    plot(x, y1, 'color', BfOrange, 'LineWidth', StdLineWidth);
    xlabel('x', 'fontsize', 16);
    ylabel('f(x)', 'fontsize', 16);
    xlim([-0.5, 0.5]);
    text(0.45,0.55, 'n=1', 'fontsize', 16);
    text(-0.4,-0.6, 'ln(1+x)', 'fontsize', 16);
    
    if DoSavePlots == 1,
      saveas(hf, '../../figures/fig_TaylorApproximation_2.png', 'png');
    end;
    
    fig_counter = fig_counter + 1;
    hf = figure(fig_counter);
    hold on;
    plot(x, y, 'color', BfBlue, 'LineWidth', StdLineWidth);
    plot(x, y1, 'color', BfOrange, 'LineWidth', StdLineWidth);
    plot(x, y2, 'color', BfBluishGreen, 'LineWidth', StdLineWidth);
    xlabel('x', 'fontsize', 16);
    ylabel('f(x)', 'fontsize', 16);
    xlim([-0.5, 0.5]);
    text(0.45,0.55, 'n=1', 'fontsize', 16);
    text(0.45,0.3, 'n=2', 'fontsize', 16);
    text(-0.4,-0.6, 'ln(1+x)', 'fontsize', 16);
        
    if DoSavePlots == 1,
      saveas(hf, '../../figures/fig_TaylorApproximation_0.png', 'png');
    end;
end;

