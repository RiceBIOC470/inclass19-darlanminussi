%In class 19
%GB comments
1A 100
1B 100
1C 100
2. 100
Overall 100


% Problem 1. Imagine a clincal trial for two drugs that are intended to lower
% cholesterol. Assume 30 subjects are randomly divided into 3 groups that
% either receive a placebo or one of the two treatments. The mean initials
% levels of total cholesterol in each group are the same. The final
% measurements look like

placebo = [   194   183   199   189   189   214   212   186   191   190];
treatment1 = [    138   217   188   126   249   217   255   196   279   123];
treatment2 =[   152   152   151   143   161   142   142   141   161   135];

%A. Make a bar plot of the means of each group with errorbars (Hint, use
%bar and then use 'hold on' and then errorbar). 


means = [mean(placebo) mean(treatment1) mean(treatment2)];
sds = [std(placebo) std(treatment1) std(treatment2)];
bar(means);
hold on;
errorbar(1:3, means, sds);


%B. Run a one way ANOVA analysis to see whether any of the treatment groups showed
%a statistically signficant difference. 

all_means = cat(2, placebo, treatment1, treatment2)
groups = {'placebo','placebo','placebo','placebo','placebo','placebo','placebo','placebo','placebo','placebo', 'treatment1', 'treatment1', 'treatment1', 'treatment1', 'treatment1', 'treatment1', 'treatment1', 'treatment1', 'treatment1', 'treatment1', 'treatment2', 'treatment2', 'treatment2', 'treatment2', 'treatment2', 'treatment2', 'treatment2', 'treatment2', 'treatment2', 'treatment2'};

[p, table, stats] = anova1(all_means, groups);
disp(p);

% anova prob shows that there is a statistical significant different
% between the groups

%C. use the multcompare function to look at all pairs of samples and
%indicate which are significantly different.

multcompare(stats);

% group treatment2 is sigficantly different from placebo and treatment 1.
% group placebo is significantly different from group treatment2
% group treatment1 is significantly different from group treatment2


%Problem 2. In this directory, you will find a .mat file with three
%variables, xdat, ydat, and ydat2. For each pair (xdat, ydat) and (xdat,
%ydat2), fit the data to a first, second and third order polynomial. Which
%one is the best fit in each case? In at least one of the cases, do the
%problem with both the polyfit/polyval functions and with the 'fit' function.


mat = load('data.mat');
disp(mat);

plot(mat.xdat, mat.ydat, 'r.', 'MarkerSize', 24);
[coeff1, s1] = polyfit(mat.xdat, mat.ydat,1);
hold on;
plot(mat.xdat, polyval(coeff1, mat.xdat), 'k-', 'LineWidth', 3);
hold off;

plot(mat.xdat, mat.ydat, 'r.', 'MarkerSize', 24);
[coeff2, s2] = polyfit(mat.xdat, mat.ydat,2);
hold on;
plot(mat.xdat, polyval(coeff2, mat.xdat), 'k-', 'LineWidth', 3);
hold off;

plot(mat.xdat, mat.ydat, 'r.', 'MarkerSize', 24);
[coeff3, s3] = polyfit(mat.xdat, mat.ydat,3);
hold on;
plot(mat.xdat, polyval(coeff3, mat.xdat), 'k-', 'LineWidth', 3);
hold off;


% ydat2
plot(mat.xdat, mat.ydat2, 'r.', 'MarkerSize', 24);
[coeffy21, s1] = polyfit(mat.xdat, mat.ydat2,1);
hold on;
plot(mat.xdat, polyval(coeffy21, mat.xdat), 'k-', 'LineWidth', 3);
hold off;

plot(mat.xdat, mat.ydat2, 'r.', 'MarkerSize', 24);
[coeffy22, s2] = polyfit(mat.xdat, mat.ydat2,2);
hold on;
plot(mat.xdat, polyval(coeffy22, mat.xdat), 'k-', 'LineWidth', 3);
hold off;

plot(mat.xdat, mat.ydat2, 'r.', 'MarkerSize', 24);
[coeffy23, s3] = polyfit(mat.xdat, mat.ydat2,3);
hold on;
plot(mat.xdat, polyval(coeffy23, mat.xdat), 'k-', 'LineWidth', 3);
hold off;

% for ydat they all fit equally well.
% for ydat2 the polynomial of third order is the best fit


% using the fit function
matfit = {mat.xdat; mat.ydat2};

fit_out = fit(mat.xdat(:), mat.ydat2(:), 'poly1');
plot(fit_out, mat.xdat, mat.ydat2)

fit_out = fit(mat.xdat(:), mat.ydat2(:), 'poly2');
plot(fit_out, mat.xdat, mat.ydat2)

fit_out = fit(mat.xdat(:), mat.ydat2(:), 'poly3');
plot(fit_out, mat.xdat, mat.ydat2)
