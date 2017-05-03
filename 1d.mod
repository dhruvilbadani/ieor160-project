reset;
reset options;

data reg_data.dat;

var coeffs{1..10}; # coeffs[i] is the regression coefficient for the ith feature
var used{1..10} binary; # used[i] is 1 if the ith feature is used, 0 otherwise

minimize sse: sum{i in 1..250}(mat[i,Y] - sum{j in 1..10}(coeffs[j]*mat[i,j]))^2; # We need to minimize the sum of squared errors
subject to sum_of_coeffs_constraint: sum{j in 1..10}used[j] <= 4; # Can use at most 4 features
subject to binary1{j in 1..10}: coeffs[j] <= 1000*used[j]; # To make sure that coeffs[j] is not nonzero when used[j] is zero
subject to binary2{j in 1..10}: coeffs[j] >= -1000*used[j]; # To make sure that coeffs[j] is not nonzero when used[j] is zero

option solver cplex;

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2; # The SSE with coeffs
param y_tot = sum{i in 1..250} mat[i,Y]; # Sum of all y
param y_hat = y_tot/250; # Mean of all y
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2; # Denominator in r-squared calculation
var r_sq = 1 - error/ss_tot; # Formula for r-squared

display r_sq, coeffs, used;