% ----------------------------------------------------------------------------- %
% Advanced Macroeconomics - Tutorial - Problem Set 12
% Ramsey Model with Taxes - Sensitivity Analysis with respect to Inverse IES
% Based on Lecture Material to Chapter 11
% This Version: 24/01/2026
% Author: Alexandra Gutsch
% ----------------------------------------------------------------------------- %

close all;
clear all;

% color pallet from lecture
BfBlack        = [   0,   0,   0 ]/255;
BfOrange       = [ 230, 159,   0 ]/255;
BfSkyBlue      = [  86, 180, 233 ]/255;
BfBluishGreen  = [   0, 158, 115 ]/255;
BfYellow       = [ 240, 228,  66 ]/255;
BfBlue         = [   0, 114, 178 ]/255;
BfVermillon    = [ 213,  94,   0 ]/255;
BfRedishPurple = [ 204, 121, 167 ]/255;

% run dynare code
dynare ramseytaxsensitivity; % adjusted code file ramseytax.mod from lecture chapter 11

% define vector with variables that should be plotted
vars = {'k', 'y', 'c', 'rnet', 'r', 's', 'w', 'gy'}; 

fig_counter = 0; 

width = 2;

% number of periods that should be plotted
period = 1:1:length(ts.y_sigma1);

% plot time paths for all values of sigma
for varnum = 1:length(vars)
    var = vars{varnum};

    fig_counter = fig_counter + 1;
    hf = figure(fig_counter); 

    hold on;
    plot(period, ts.([char(var) '_sigma1']), 'color', BfBlue, 'Linewidth', width); % *100 because in percent
    plot(period, ts.([char(var) '_sigma2']), 'color', BfOrange, 'Linewidth', width, 'LineStyle', '--'); 
    plot(period, ts.([char(var) '_sigma3']), 'color', BfRedishPurple, 'Linewidth', width, 'LineStyle', ':'); 
    set(gca, 'ygrid', 'on');
    set(gca, 'xgrid', 'on');
    hold off;

    xlabel('period');
    ylabel('level');
    xlim([period(1), period(end)]);
    xbounds = xlim();
    set(gca, 'xtick', xbounds(1):5:xbounds(2)); 
    title(var);
    
    % add legend
    legend('sigma = 0.5', 'sigma = 1', 'sigma = 1.5');
    legend boxoff;

    % save plot
    saveas(hf, ['TS_sigma_', var, '.png']);
end

