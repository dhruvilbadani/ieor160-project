reset;
reset options;

data reg_data.dat;

var coeffs{1..n_features}; # coeffs[i] is the regression coefficient for the ith feature
var coeffs_second_order{j in 1..n_features, k in j..n_features}; # coeffs[i,j] is the regression coefficient for the second order interaction between the ith and jth feature
var used{1..n_features} binary; # used[i] is 1 if the ith feature is used, 0 otherwise
var used_second_order{j in 1..n_features, k in j..n_features} binary; # used_second_order[i,j] is 1 if the second order interaction between the ith and jth feature is used, 0 otherwise

minimize sse: sum{i in 1..n_train}(mat[i,Y] - sum{j in 1..n_features}(coeffs[j]*mat[i,j]) - sum{j in 1..n_features, k in j..n_features}(mat[i,j]*mat[i,k]*coeffs_second_order[j,k]))^2; # We need to minimize the sum of squared errors
subject to sum_of_coeffs_constraint: sum{j in 1..n_features}used[j] + sum{j in 1..n_features, k in j..n_features} used_second_order[j,k] <= 10; # Use at most 10 features
subject to binary1{j in 1..n_features}: coeffs[j] <= first_order_coeff_bound*used[j]; # To make sure that coeffs[i] is not nonzero when used[i] is 0
subject to binary2{j in 1..n_features}: coeffs[j] >= -first_order_coeff_bound*used[j]; # To make sure that coeffs[i] is not nonzero when used[i] is 0
subject to binary3{j in 1..n_features, k in j..n_features}: coeffs_second_order[j,k] <= second_order_coeff_bound*used_second_order[j,k]; # To make sure that coeffs[i,j] is not nonzero when used[i,j] is 0
subject to binary4{j in 1..n_features, k in j..n_features}: coeffs_second_order[j,k] >= -second_order_coeff_bound*used_second_order[j,k];
option solver cplex; # To make sure that coeffs[i,j] is not nonzero when used[i,j] is 0

solve;

var error = sum{i in 1..n_train} (sum{j in 1..n_features}(coeffs[j]*mat[i,j]) + sum{j in 1..n_features, k in j..n_features}(mat[i, j] * mat[i, k] * coeffs_second_order[j,k]) - mat[i, Y])^2; # The SSE with coeffs and coeffs_second_order
param y_tot = sum{i in 1..n_train} mat[i,Y]; # Sum of all y
param y_hat = y_tot/n_train; # Mean of all y
param ss_tot = sum{i in 1..n_train}(mat[i,Y] - y_hat)^2; # Denominator in r-squared
var r_sq = 1 - error/ss_tot; # r-squared
var adj_r_sq = r_sq - (1-r_sq)*(2/247);

display sse,r_sq, error, coeffs,coeffs_second_order, used, used_second_order;