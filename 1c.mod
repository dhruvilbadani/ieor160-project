reset;
reset options;

option solver cplex;

data reg_data.dat;

var coeffs{1..10}; # coeffs[i] is the regression coefficient for the ith feature
var z{1..10}; # z[i] is the absolute value of coeffs[i]

print "Lambda =", lambdas[1]; # Setting lambda

minimize sse: sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2 + sum{k in 1..10}lambdas[1]*z[k]; # We need to minimize the sum of squared errors + the regularization penalty
subject to abs_1 {j in 1..10}: z[j] >= coeffs[j]; # To implement the absolute value l1-penalty
subject to abs_2 {j in 1..10}: z[j] >= -coeffs[j]; # To implement the absolute value l1-penalty

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2; # The SSE with coeffs
param y_tot = sum{i in 1..250} mat[i,Y]; # Sum of all y
param y_hat = y_tot/250; # Mean of all y
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2; # Denominator in r-squared calculation
var r_sq = 1 - error/ss_tot; # Formula for r-squared

display sse, error, y_hat, ss_tot, r_sq, coeffs, z;

#############################################################################

reset;
reset options;

option solver cplex;

data reg_data.dat;

var coeffs{1..10}; # coeffs[i] is the regression coefficient for the ith feature
var z{1..10}; # z[i] is the absolute value of coeffs[i]

print "Lambda =", lambdas[2]; # Setting lambda

minimize sse: sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2 + sum{k in 1..10}lambdas[2]*z[k]; # We need to minimize the sum of squared errors + the regularization penalty
subject to abs_1 {j in 1..10}: z[j] >= coeffs[j]; # To implement the absolute value l1-penalty
subject to abs_2 {j in 1..10}: z[j] >= -coeffs[j]; # To implement the absolute value l1-penalty

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2; # The SSE with coeffs
param y_tot = sum{i in 1..250} mat[i,Y]; # Sum of all y
param y_hat = y_tot/250; # Mean of all y
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2; # Denominator in r-squared calculation
var r_sq = 1 - error/ss_tot; # Formula for r-squared

display sse, error, y_hat, ss_tot, r_sq, coeffs, z;

#############################################################################

reset;
reset options;

option solver cplex;

data reg_data.dat;

var coeffs{1..10}; # coeffs[i] is the regression coefficient for the ith feature
var z{1..10}; # z[i] is the absolute value of coeffs[i]

print "Lambda =", lambdas[3]; # Setting lambda

minimize sse: sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2 + sum{k in 1..10}lambdas[3]*z[k]; # We need to minimize the sum of squared errors + the regularization penalty
subject to abs_1 {j in 1..10}: z[j] >= coeffs[j]; # To implement the absolute value l1-penalty
subject to abs_2 {j in 1..10}: z[j] >= -coeffs[j]; # To implement the absolute value l1-penalty

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2; # The SSE with coeffs
param y_tot = sum{i in 1..250} mat[i,Y]; # Sum of all y
param y_hat = y_tot/250; # Mean of all y
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2; # Denominator in r-squared calculation
var r_sq = 1 - error/ss_tot; # Formula for r-squared

display sse, error, y_hat, ss_tot, r_sq, coeffs, z;

#############################################################################

reset;
reset options;

option solver cplex;

data reg_data.dat;

var coeffs{1..10}; # coeffs[i] is the regression coefficient for the ith feature
var z{1..10}; # z[i] is the absolute value of coeffs[i]

print "Lambda =", lambdas[4]; # Setting lambda

minimize sse: sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2 + sum{k in 1..10}lambdas[4]*z[k]; # We need to minimize the sum of squared errors + the regularization penalty
subject to abs_1 {j in 1..10}: z[j] >= coeffs[j]; # To implement the absolute value l1-penalty
subject to abs_2 {j in 1..10}: z[j] >= -coeffs[j]; # To implement the absolute value l1-penalty

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2; # The SSE with coeffs
param y_tot = sum{i in 1..250} mat[i,Y]; # Sum of all y
param y_hat = y_tot/250; # Mean of all y
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2; # Denominator in r-squared calculation
var r_sq = 1 - error/ss_tot; # Formula for r-squared

display sse, error, y_hat, ss_tot, r_sq, coeffs, z;

#############################################################################

reset;
reset options;

option solver cplex;

data reg_data.dat;

var coeffs{1..10}; # coeffs[i] is the regression coefficient for the ith feature
var z{1..10}; # z[i] is the absolute value of coeffs[i]

print "Lambda =", lambdas[5]; # Setting lambda

minimize sse: sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2 + sum{k in 1..10}lambdas[5]*z[k]; # We need to minimize the sum of squared errors + the regularization penalty
subject to abs_1 {j in 1..10}: z[j] >= coeffs[j]; # To implement the absolute value l1-penalty
subject to abs_2 {j in 1..10}: z[j] >= -coeffs[j]; # To implement the absolute value l1-penalty

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2; # The SSE with coeffs
param y_tot = sum{i in 1..250} mat[i,Y]; # Sum of all y
param y_hat = y_tot/250; # Mean of all y
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2; # Denominator in r-squared calculation
var r_sq = 1 - error/ss_tot; # Formula for r-squared

display sse, error, y_hat, ss_tot, r_sq, coeffs, z;

#############################################################################

reset;
reset options;

option solver cplex;

data reg_data.dat;

var coeffs{1..10}; # coeffs[i] is the regression coefficient for the ith feature
var z{1..10}; # z[i] is the absolute value of coeffs[i]

print "Lambda =", lambdas[6]; # Setting lambda

minimize sse: sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2 + sum{k in 1..10}lambdas[6]*z[k]; # We need to minimize the sum of squared errors + the regularization penalty
subject to abs_1 {j in 1..10}: z[j] >= coeffs[j]; # To implement the absolute value l1-penalty
subject to abs_2 {j in 1..10}: z[j] >= -coeffs[j]; # To implement the absolute value l1-penalty

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2; # The SSE with coeffs
param y_tot = sum{i in 1..250} mat[i,Y]; # Sum of all y
param y_hat = y_tot/250; # Mean of all y
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2; # Denominator in r-squared calculation
var r_sq = 1 - error/ss_tot; # Formula for r-squared

display sse, error, y_hat, ss_tot, r_sq, coeffs, z;

#############################################################################

reset;
reset options;

option solver cplex;

data reg_data.dat;

var coeffs{1..10}; # coeffs[i] is the regression coefficient for the ith feature
var z{1..10}; # z[i] is the absolute value of coeffs[i]

print "Lambda =", lambdas[7]; # Setting lambda

minimize sse: sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2 + sum{k in 1..10}lambdas[7]*z[k]; # We need to minimize the sum of squared errors + the regularization penalty
subject to abs_1 {j in 1..10}: z[j] >= coeffs[j]; # To implement the absolute value l1-penalty
subject to abs_2 {j in 1..10}: z[j] >= -coeffs[j]; # To implement the absolute value l1-penalty

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2; # The SSE with coeffs
param y_tot = sum{i in 1..250} mat[i,Y]; # Sum of all y
param y_hat = y_tot/250; # Mean of all y
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2; # Denominator in r-squared calculation
var r_sq = 1 - error/ss_tot; # Formula for r-squared

display sse, error, y_hat, ss_tot, r_sq, coeffs, z;

#############################################################################

reset;
reset options;

option solver cplex;

data reg_data.dat;

var coeffs{1..10}; # coeffs[i] is the regression coefficient for the ith feature
var z{1..10}; # z[i] is the absolute value of coeffs[i]

print "Lambda =", lambdas[8]; # Setting lambda

minimize sse: sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2 + sum{k in 1..10}lambdas[8]*z[k]; # We need to minimize the sum of squared errors + the regularization penalty
subject to abs_1 {j in 1..10}: z[j] >= coeffs[j]; # To implement the absolute value l1-penalty
subject to abs_2 {j in 1..10}: z[j] >= -coeffs[j]; # To implement the absolute value l1-penalty

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2; # The SSE with coeffs
param y_tot = sum{i in 1..250} mat[i,Y]; # Sum of all y
param y_hat = y_tot/250; # Mean of all y
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2; # Denominator in r-squared calculation
var r_sq = 1 - error/ss_tot; # Formula for r-squared

display sse, error, y_hat, ss_tot, r_sq, coeffs, z;

#############################################################################

reset;
reset options;

option solver cplex;

data reg_data.dat;

var coeffs{1..10}; # coeffs[i] is the regression coefficient for the ith feature
var z{1..10}; # z[i] is the absolute value of coeffs[i]

print "Lambda =", lambdas[9]; # Setting lambda

minimize sse: sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2 + sum{k in 1..10}lambdas[9]*z[k]; # We need to minimize the sum of squared errors + the regularization penalty
subject to abs_1 {j in 1..10}: z[j] >= coeffs[j]; # To implement the absolute value l1-penalty
subject to abs_2 {j in 1..10}: z[j] >= -coeffs[j]; # To implement the absolute value l1-penalty

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2; # The SSE with coeffs
param y_tot = sum{i in 1..250} mat[i,Y]; # Sum of all y
param y_hat = y_tot/250; # Mean of all y
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2; # Denominator in r-squared calculation
var r_sq = 1 - error/ss_tot; # Formula for r-squared

display sse, error, y_hat, ss_tot, r_sq, coeffs, z;

#############################################################################

reset;
reset options;

option solver cplex;

data reg_data.dat;

var coeffs{1..10}; # coeffs[i] is the regression coefficient for the ith feature
var z{1..10}; # z[i] is the absolute value of coeffs[i]

print "Lambda =", lambdas[10]; # Setting lambda

minimize sse: sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2 + sum{k in 1..10}lambdas[10]*z[k]; # We need to minimize the sum of squared errors + the regularization penalty
subject to abs_1 {j in 1..10}: z[j] >= coeffs[j]; # To implement the absolute value l1-penalty
subject to abs_2 {j in 1..10}: z[j] >= -coeffs[j]; # To implement the absolute value l1-penalty

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2; # The SSE with coeffs
param y_tot = sum{i in 1..250} mat[i,Y]; # Sum of all y
param y_hat = y_tot/250; # Mean of all y
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2; # Denominator in r-squared calculation
var r_sq = 1 - error/ss_tot; # Formula for r-squared

display sse, error, y_hat, ss_tot, r_sq, coeffs, z;

#############################################################################

reset;
reset options;

option solver cplex;

data reg_data.dat;

var coeffs{1..10}; # coeffs[i] is the regression coefficient for the ith feature
var z{1..10}; # z[i] is the absolute value of coeffs[i]

print "Lambda =", lambdas[11]; # Setting lambda

minimize sse: sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2 + sum{k in 1..10}lambdas[11]*z[k]; # We need to minimize the sum of squared errors + the regularization penalty
subject to abs_1 {j in 1..10}: z[j] >= coeffs[j]; # To implement the absolute value l1-penalty
subject to abs_2 {j in 1..10}: z[j] >= -coeffs[j]; # To implement the absolute value l1-penalty

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2; # The SSE with coeffs
param y_tot = sum{i in 1..250} mat[i,Y]; # Sum of all y
param y_hat = y_tot/250; # Mean of all y
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2; # Denominator in r-squared calculation
var r_sq = 1 - error/ss_tot; # Formula for r-squared

display sse, error, y_hat, ss_tot, r_sq, coeffs, z;

#############################################################################

