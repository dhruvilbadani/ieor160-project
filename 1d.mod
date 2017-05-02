reset;
reset options;

data reg_data.dat;

var coeffs{1..10};
var used{1..10} binary;

minimize sse: sum{i in 1..250}(mat[i,Y] - sum{j in 1..10}(coeffs[j]*mat[i,j]))^2;
subject to sum_of_coeffs_constraint: sum{j in 1..10}used[j] <= 4;
subject to binary1{j in 1..10}: coeffs[j] <= 1000*used[j];
subject to binary2{j in 1..10}: coeffs[j] >= -1000*used[j];

option solver cplex;

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2;
param y_tot = sum{i in 1..250} mat[i,Y];
param y_hat = y_tot/250;
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2;
var r_sq = 1 - error/ss_tot;

display r_sq, coeffs, used;