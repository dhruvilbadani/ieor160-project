reset;
reset options;

option solver cplex;

data reg_data.dat;

var coeffs{1..n_features}; # coeffs[i] is the regression coefficient for the ith feature
var coeffs_second_order{j in 1..n_features, k in j..n_features}; # coeffs[i,j] is the regression coefficient for the second order interaction between the ith and jth feature
var z_coeffs{1..n_features}; # z[i] is the absolute value of coeffs[i]
var z_coeffs_second_order{j in 1..n_features, k in j..n_features}; # z[i,j] is the absolute value of coeffs_second_order[i,j]

print "Lambda =", lambda_part_2;

minimize sse: sum{i in 1..n_train} (sum{j in 1..n_features}(coeffs[j]*mat[i,j]) + sum{j in 1..n_features, k in j..n_features}(mat[i, j] * mat[i, k] * coeffs_second_order[j,k]) - mat[i, Y])**2 + sum{k in 1..n_features}lambda_part_2*z_coeffs[k] + sum{j in 1..n_features, k in j..n_features} lambda_part_2*z_coeffs_second_order[j,k]; # We need to minimize the sum of the squared errors + the regularization penalty
subject to abs_1 {j in 1..n_features}: z_coeffs[j] >= coeffs[j]; # To implement absolute value function
subject to abs_2 {j in 1..n_features}: z_coeffs[j] >= -coeffs[j]; # To implement absolute value function
subject to abs_3{j in 1..n_features, k in j..n_features}: z_coeffs_second_order[j,k] >= coeffs_second_order[j,k]; # To implement absolute value function
subject to abs_4{j in 1..n_features, k in j..n_features}: z_coeffs_second_order[j,k] >= -coeffs_second_order[j,k]; # To implement absolute value function
solve;

var error = sum{i in 1..n_train} (sum{j in 1..n_features}(coeffs[j]*mat[i,j]) + sum{j in 1..n_features, k in j..n_features}(mat[i, j] * mat[i, k] * coeffs_second_order[j,k]) - mat[i, Y])^2; # The SSE with coeffs and coeffs_second_order
param y_tot = sum{i in 1..n_train} mat[i,Y]; # Sum of all y
param y_hat = y_tot/n_train; # Mean of all y
param ss_tot = sum{i in 1..n_train}(mat[i,Y] - y_hat)^2; # Denominator in r-squared
var r_sq = 1 - error/ss_tot; # r-squared
var adj_r_sq = r_sq - (1-r_sq)*(2/247);

display sse, error, y_hat, ss_tot, r_sq, coeffs, coeffs_second_order;