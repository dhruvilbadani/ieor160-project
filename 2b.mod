reset;
reset options;

data reg_data.dat;

var coeffs{1..10};
var coeffs_second_order{j in 1..10, k in j..10};
var used{1..10} binary;
var used_second_order{j in 1..10, k in j..10} binary;

minimize sse: sum{i in 1..250}(mat[i,Y] - sum{j in 1..10}(coeffs[j]*mat[i,j]) - sum{j in 1..10, k in j..10}(mat[i,j]*mat[i,k]*coeffs_second_order[j,k]))^2;
subject to sum_of_coeffs_constraint: sum{j in 1..10}used[j] + sum{j in 1..10, k in j..10} used_second_order[j,k] = 10;
subject to binary1{j in 1..10}: coeffs[j] <= 1000*used[j];
subject to binary2{j in 1..10}: coeffs[j] >= -1000*used[j];
subject to binary3{j in 1..10, k in j..10}: coeffs_second_order[j,k] <= 5000*used_second_order[j,k];
subject to binary4{j in 1..10, k in j..10}: coeffs_second_order[j,k] >= -5000*used_second_order[j,k];
option solver cplex;

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] + sum{j in 1..10, k in j..10} (mat[i, j] * mat[i, k] * coeffs_second_order[j,k]) - mat[i, Y])^2;
param y_tot = sum{i in 1..250} mat[i,Y];
param y_hat = y_tot/250;
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2;
var r_sq = 1 - error/ss_tot;

display sse,r_sq, error, coeffs,coeffs_second_order, used, used_second_order;