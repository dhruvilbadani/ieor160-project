option solver minos;

#########################################################################

reset;

data reg_data.dat;

print "Leaving out SEX";

var coeffs{1..10}; # coeffs[i] is the regression coefficient for the ith feature

minimize sse: sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2; # We need to minimize the sum of squared errors
subject to not_use_S1: coeffs[S1] = 0; # Use only the features mentioned above
subject to not_use_S2: coeffs[S2] = 0; # Use only the features mentioned above
subject to not_use_S3: coeffs[S3] = 0; # Use only the features mentioned above
subject to not_use_S4: coeffs[S4] = 0; # Use only the features mentioned above
subject to not_use_AGE: coeffs[AGE] = 0; # Use only the features mentioned above
subject to not_use_SEX: coeffs[SEX] = 0; # Use only the features mentioned above

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2; # The SSE with coeffs
param y_tot = sum{i in 1..250} mat[i,Y]; # Sum of all y
param y_hat = y_tot/250; # Mean of all y
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2; # Denominator in r-squared calculation
var r_sq = 1 - error/ss_tot; # Formula for r-squared

display sse, error, y_hat, ss_tot, r_sq, coeffs; # Displaying results

#########################################################################

reset;

data reg_data.dat;

print "Leaving out BMI";

var coeffs{1..10}; # coeffs[i] is the regression coefficient for the ith feature

minimize sse: sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2; # We need to minimize the sum of squared errors
subject to not_use_S1: coeffs[S1] = 0; # Use only the features mentioned above
subject to not_use_S2: coeffs[S2] = 0; # Use only the features mentioned above
subject to not_use_S3: coeffs[S3] = 0; # Use only the features mentioned above
subject to not_use_S4: coeffs[S4] = 0; # Use only the features mentioned above
subject to not_use_AGE: coeffs[AGE] = 0; # Use only the features mentioned above
subject to not_use_BMI: coeffs[BMI] = 0; # Use only the features mentioned above

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2; # The SSE with coeffs
param y_tot = sum{i in 1..250} mat[i,Y]; # Sum of all y
param y_hat = y_tot/250; # Mean of all y
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2; # Denominator in r-squared calculation
var r_sq = 1 - error/ss_tot; # Formula for r-squared

display sse, error, y_hat, ss_tot, r_sq, coeffs; # Displaying results 

#########################################################################

reset;

data reg_data.dat;

print "Leaving out BP";

var coeffs{1..10}; # coeffs[i] is the regression coefficient for the ith feature

minimize sse: sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2; # We need to minimize the sum of squared errors
subject to not_use_S1: coeffs[S1] = 0; # Use only the features mentioned above
subject to not_use_S2: coeffs[S2] = 0; # Use only the features mentioned above
subject to not_use_S3: coeffs[S3] = 0; # Use only the features mentioned above
subject to not_use_S4: coeffs[S4] = 0; # Use only the features mentioned above
subject to not_use_AGE: coeffs[AGE] = 0; # Use only the features mentioned above
subject to not_use_BP: coeffs[BP] = 0; # Use only the features mentioned above

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2; # The SSE with coeffs
param y_tot = sum{i in 1..250} mat[i,Y]; # Sum of all y
param y_hat = y_tot/250; # Mean of all y
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2; # Denominator in r-squared calculation
var r_sq = 1 - error/ss_tot; # Formula for r-squared

display sse, error, y_hat, ss_tot, r_sq, coeffs; # Displaying results

#########################################################################

reset;

data reg_data.dat;

print "Leaving out S5";

var coeffs{1..10}; # coeffs[i] is the regression coefficient for the ith feature

minimize sse: sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2; # We need to minimize the sum of squared errors
subject to not_use_S1: coeffs[S1] = 0; # Use only the features mentioned above
subject to not_use_S2: coeffs[S2] = 0; # Use only the features mentioned above
subject to not_use_S3: coeffs[S3] = 0; # Use only the features mentioned above
subject to not_use_S4: coeffs[S4] = 0; # Use only the features mentioned above
subject to not_use_AGE: coeffs[AGE] = 0; # Use only the features mentioned above
subject to not_use_S5: coeffs[S5] = 0; # Use only the features mentioned above

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2; # The SSE with coeffs
param y_tot = sum{i in 1..250} mat[i,Y]; # Sum of all y
param y_hat = y_tot/250; # Mean of all y
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2; # Denominator in r-squared calculation
var r_sq = 1 - error/ss_tot; # Formula for r-squared

display sse, error, y_hat, ss_tot, r_sq, coeffs; # Displaying results

#########################################################################

reset;

data reg_data.dat;

print "Leaving out S6";

var coeffs{1..10}; # coeffs[i] is the regression coefficient for the ith feature

minimize sse: sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2; # We need to minimize the sum of squared errors
subject to not_use_S1: coeffs[S1] = 0; # Use only the features mentioned above
subject to not_use_S2: coeffs[S2] = 0; # Use only the features mentioned above
subject to not_use_S3: coeffs[S3] = 0; # Use only the features mentioned above
subject to not_use_S4: coeffs[S4] = 0; # Use only the features mentioned above
subject to not_use_AGE: coeffs[AGE] = 0; # Use only the features mentioned above
subject to not_use_S6: coeffs[S6] = 0; # Use only the features mentioned above

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2; # The SSE with coeffs
param y_tot = sum{i in 1..250} mat[i,Y]; # Sum of all y
param y_hat = y_tot/250; # Mean of all y
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2; # Denominator in r-squared calculation
var r_sq = 1 - error/ss_tot; # Formula for r-squared

display sse, error, y_hat, ss_tot, r_sq, coeffs; # Displaying results