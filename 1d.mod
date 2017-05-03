reset;
reset options;

data reg_data.dat;

var coeffs{1..n_features}; # coeffs[i] is the regression coefficient for the ith feature
var used{1..n_features} binary; # used[i] is 1 if the ith feature is used, 0 otherwise

minimize sse: sum{i in 1..n_train}(mat[i,Y] - sum{j in 1..n_features}(coeffs[j]*mat[i,j]))^2; # We need to minimize the sum of squared errors
subject to sum_of_coeffs_constraint: sum{j in 1..n_features}used[j] <= 4; # Can use at most 4 features
subject to binary1{j in 1..n_features}: coeffs[j] <= first_order_coeff_bound*used[j]; # To make sure that coeffs[j] is not nonzero when used[j] is zero
subject to binary2{j in 1..n_features}: coeffs[j] >= -first_order_coeff_bound*used[j]; # To make sure that coeffs[j] is not nonzero when used[j] is zero

option solver cplex;

solve;

var error = sum{i in 1..n_train} (sum{j in 1..n_features}coeffs[j]*mat[i,j] - mat[i, Y])^2; # The SSE with coeffs
param y_tot = sum{i in 1..n_train} mat[i,Y]; # Sum of all y
param y_hat = y_tot/n_train; # Mean of all y
param ss_tot = sum{i in 1..n_train}(mat[i,Y] - y_hat)^2; # Denominator in r-squared calculation
var r_sq = 1 - error/ss_tot; # Formula for r-squared

display r_sq, coeffs, used;