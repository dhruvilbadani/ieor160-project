option solver minos; # No integer programming here

#########################################################################

reset;

data reg_data.dat;

print "Looking at the p-values, we should use BMI, S5, Sex, BP"; # Features from p-values

var coeffs{1..n_features}; # coeffs[i] is the regression coefficient for the ith feature

minimize sse: sum{i in 1..n_train} (sum{j in 1..n_features}coeffs[j]*mat[i,j] - mat[i, Y])^2; # We need to minimize sum of squared errors
subject to not_use_S1: coeffs[S1] = 0; # Use only the 4 features mentioned above
subject to not_use_S2: coeffs[S2] = 0; # Use only the 4 features mentioned above
subject to not_use_S3: coeffs[S3] = 0; # Use only the 4 features mentioned above
subject to not_use_S4: coeffs[S4] = 0; # Use only the 4 features mentioned above
subject to not_use_AGE: coeffs[AGE] = 0; # Use only the 4 features mentioned above
subject to not_use_S6: coeffs[S6] = 0; # Use only the 4 features mentioned above

solve;

var error = sum{i in 1..n_train} (sum{j in 1..n_features}coeffs[j]*mat[i,j] - mat[i, Y])^2; # The SSE with coeffs
param y_tot = sum{i in 1..n_train} mat[i,Y]; # Sum of all y
param y_hat = y_tot/n_train; # Mean of all y
param ss_tot = sum{i in 1..n_train}(mat[i,Y] - y_hat)^2; # Denominator in r-squared calculation
var r_sq = 1 - error/ss_tot; # Formula for r-squared

display sse, error, y_hat, ss_tot, r_sq, coeffs; # Displaying results