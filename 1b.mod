option solver minos;

#########################################################################

reset;

data reg_data.dat;

print "Leaving out SEX";

var coeffs{1..10};

minimize sse: sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2;
subject to not_use_S1: coeffs[S1] = 0;
subject to not_use_S2: coeffs[S2] = 0;
subject to not_use_S3: coeffs[S3] = 0;
subject to not_use_S4: coeffs[S4] = 0;
subject to not_use_AGE: coeffs[AGE] = 0;
subject to not_use_SEX: coeffs[SEX] = 0;

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2;
param y_tot = sum{i in 1..250} mat[i,Y];
param y_hat = y_tot/250;
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2;
var r_sq = 1 - error/ss_tot;

display sse, error, y_hat, ss_tot, r_sq, coeffs; 

#########################################################################

reset;

data reg_data.dat;

print "Leaving out BMI";

var coeffs{1..10};

minimize sse: sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2;
subject to not_use_S1: coeffs[S1] = 0;
subject to not_use_S2: coeffs[S2] = 0;
subject to not_use_S3: coeffs[S3] = 0;
subject to not_use_S4: coeffs[S4] = 0;
subject to not_use_AGE: coeffs[AGE] = 0;
subject to not_use_BMI: coeffs[BMI] = 0;

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2;
param y_tot = sum{i in 1..250} mat[i,Y];
param y_hat = y_tot/250;
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2;
var r_sq = 1 - error/ss_tot;

display sse, error, y_hat, ss_tot, r_sq, coeffs; 

#########################################################################

reset;

print "Leaving out BP";

data reg_data.dat;

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

#######################################################################

reset;

print "Leaving out S5";

data reg_data.dat;

var coeffs{1..10};

minimize sse: sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2;
subject to not_use_S1: coeffs[S1] = 0;
subject to not_use_S2: coeffs[S2] = 0;
subject to not_use_S3: coeffs[S3] = 0;
subject to not_use_S4: coeffs[S4] = 0;
subject to not_use_AGE: coeffs[AGE] = 0;
subject to not_use_S5: coeffs[S5] = 0;

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2;
param y_tot = sum{i in 1..250} mat[i,Y];
param y_hat = y_tot/250;
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2;
var r_sq = 1 - error/ss_tot;

display sse, error, y_hat, ss_tot, r_sq, coeffs; 

#########################################################################

reset;

print "Leaving out S6";

data reg_data.dat;

var coeffs{1..10};

minimize sse: sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2;
subject to not_use_S1: coeffs[S1] = 0;
subject to not_use_S2: coeffs[S2] = 0;
subject to not_use_S3: coeffs[S3] = 0;
subject to not_use_S4: coeffs[S4] = 0;
subject to not_use_AGE: coeffs[AGE] = 0;
subject to not_use_S6: coeffs[S6] = 0;

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2;
param y_tot = sum{i in 1..250} mat[i,Y];
param y_hat = y_tot/250;
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2;;
var r_sq = 1 - error/ss_tot;

display sse, error, y_hat, ss_tot, r_sq, coeffs; 