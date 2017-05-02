option solver minos;

#########################################################################

reset;

data reg_data.dat;

print "Looking at the p-values, we should use BMI, S5, Sex, S6";

var coeffs{1..10};

minimize sse: sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2;
subject to not_use_S1: coeffs[S1] = 0;
subject to not_use_S2: coeffs[S2] = 0;
subject to not_use_S3: coeffs[S3] = 0;
subject to not_use_S4: coeffs[S4] = 0;
subject to not_use_AGE: coeffs[AGE] = 0;
subject to not_use_BP: coeffs[BP] = 0;

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2;
param y_tot = sum{i in 1..250} mat[i,Y];
param y_hat = y_tot/250;
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2;
var r_sq = 1 - error/ss_tot;

display sse, error, y_hat, ss_tot, r_sq, coeffs;