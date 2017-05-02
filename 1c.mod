reset;
reset options;

option solver cplex;

data reg_data.dat;

var coeffs{1..10};
var z{1..10};

print "Lambda =", lambdas[1];

minimize sse: sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2 + sum{k in 1..10}lambdas[1]*z[k];
subject to abs_1 {j in 1..10}: z[j] >= coeffs[j];
subject to abs_2 {j in 1..10}: z[j] >= -coeffs[j];

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2;
param y_tot = sum{i in 1..250} mat[i,Y];
param y_hat = y_tot/250;
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2;
var r_sq = 1 - error/ss_tot;
var adj_r_sq = r_sq - (1-r_sq)*(2/247);

display sse, error, y_hat, ss_tot, r_sq, coeffs, z;

#############################################################################

reset;
reset options;

option solver cplex;

data reg_data.dat;

var coeffs{1..10};
var z{1..10};

print "Lambda =", lambdas[2];

minimize sse: sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2 + sum{k in 1..10}lambdas[2]*z[k];
subject to abs_1 {j in 1..10}: z[j] >= coeffs[j];
subject to abs_2 {j in 1..10}: z[j] >= -coeffs[j];

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2;
param y_tot = sum{i in 1..250} mat[i,Y];
param y_hat = y_tot/250;
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2;
var r_sq = 1 - error/ss_tot;
var adj_r_sq = r_sq - (1-r_sq)*(2/247);

display sse, error, y_hat, ss_tot, r_sq, coeffs, z;

#############################################################################

reset;
reset options;

option solver cplex;

data reg_data.dat;

var coeffs{1..10};
var z{1..10};

print "Lambda =", lambdas[3];

minimize sse: sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2 + sum{k in 1..10}lambdas[3]*z[k];
subject to abs_1 {j in 1..10}: z[j] >= coeffs[j];
subject to abs_2 {j in 1..10}: z[j] >= -coeffs[j];

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2;
param y_tot = sum{i in 1..250} mat[i,Y];
param y_hat = y_tot/250;
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2;
var r_sq = 1 - error/ss_tot;
var adj_r_sq = r_sq - (1-r_sq)*(2/247);

display sse, error, y_hat, ss_tot, r_sq, coeffs, z;

#############################################################################

reset;
reset options;

option solver cplex;

data reg_data.dat;

var coeffs{1..10};
var z{1..10};

print "Lambda =", lambdas[4];

minimize sse: sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2 + sum{k in 1..10}lambdas[4]*z[k];
subject to abs_1 {j in 1..10}: z[j] >= coeffs[j];
subject to abs_2 {j in 1..10}: z[j] >= -coeffs[j];

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2;
param y_tot = sum{i in 1..250} mat[i,Y];
param y_hat = y_tot/250;
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2;
var r_sq = 1 - error/ss_tot;
var adj_r_sq = r_sq - (1-r_sq)*(2/247);

display sse, error, y_hat, ss_tot, r_sq, coeffs, z;
#############################################################################

reset;
reset options;

option solver cplex;

data reg_data.dat;

var coeffs{1..10};
var z{1..10};

print "Lambda =", lambdas[5];

minimize sse: sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2 + sum{k in 1..10}lambdas[5]*z[k];
subject to abs_1 {j in 1..10}: z[j] >= coeffs[j];
subject to abs_2 {j in 1..10}: z[j] >= -coeffs[j];

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2;
param y_tot = sum{i in 1..250} mat[i,Y];
param y_hat = y_tot/250;
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2;
var r_sq = 1 - error/ss_tot;
var adj_r_sq = r_sq - (1-r_sq)*(2/247);

display sse, error, y_hat, ss_tot, r_sq, coeffs, z;

#############################################################################

reset;
reset options;

option solver cplex;

data reg_data.dat;

var coeffs{1..10};
var z{1..10};

print "Lambda =", lambdas[6];

minimize sse: sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2 + sum{k in 1..10}lambdas[6]*z[k];
subject to abs_1 {j in 1..10}: z[j] >= coeffs[j];
subject to abs_2 {j in 1..10}: z[j] >= -coeffs[j];

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2;
param y_tot = sum{i in 1..250} mat[i,Y];
param y_hat = y_tot/250;
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2;
var r_sq = 1 - error/ss_tot;
var adj_r_sq = r_sq - (1-r_sq)*(2/247);

display sse, error, y_hat, ss_tot, r_sq, coeffs, z;

#############################################################################

reset;
reset options;

option solver cplex;

data reg_data.dat;

var coeffs{1..10};
var z{1..10};

print "Lambda =", lambdas[7];

minimize sse: sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2 + sum{k in 1..10}lambdas[7]*z[k];
subject to abs_1 {j in 1..10}: z[j] >= coeffs[j];
subject to abs_2 {j in 1..10}: z[j] >= -coeffs[j];

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2;
param y_tot = sum{i in 1..250} mat[i,Y];
param y_hat = y_tot/250;
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2;
var r_sq = 1 - error/ss_tot;
var adj_r_sq = r_sq - (1-r_sq)*(2/247);

display sse, error, y_hat, ss_tot, r_sq, coeffs, z;

#############################################################################

reset;
reset options;

option solver cplex;

data reg_data.dat;

var coeffs{1..10};
var z{1..10};

print "Lambda =", lambdas[8];

minimize sse: sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2 + sum{k in 1..10}lambdas[8]*z[k];
subject to abs_1 {j in 1..10}: z[j] >= coeffs[j];
subject to abs_2 {j in 1..10}: z[j] >= -coeffs[j];

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2;
param y_tot = sum{i in 1..250} mat[i,Y];
param y_hat = y_tot/250;
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2;
var r_sq = 1 - error/ss_tot;
var adj_r_sq = r_sq - (1-r_sq)*(2/247);

display sse, error, y_hat, ss_tot, r_sq, coeffs, z;

#############################################################################

reset;
reset options;

option solver cplex;

data reg_data.dat;

var coeffs{1..10};
var z{1..10};

print "Lambda =", lambdas[9];

minimize sse: sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2 + sum{k in 1..10}lambdas[9]*z[k];
subject to abs_1 {j in 1..10}: z[j] >= coeffs[j];
subject to abs_2 {j in 1..10}: z[j] >= -coeffs[j];

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2;
param y_tot = sum{i in 1..250} mat[i,Y];
param y_hat = y_tot/250;
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2;
var r_sq = 1 - error/ss_tot;
var adj_r_sq = r_sq - (1-r_sq)*(2/247);

display sse, error, y_hat, ss_tot, r_sq, coeffs, z;

#############################################################################

reset;
reset options;

option solver cplex;

data reg_data.dat;

var coeffs{1..10};
var z{1..10};

print "Lambda =", lambdas[10];

minimize sse: sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2 + sum{k in 1..10}lambdas[10]*z[k];
subject to abs_1 {j in 1..10}: z[j] >= coeffs[j];
subject to abs_2 {j in 1..10}: z[j] >= -coeffs[j];

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2;
param y_tot = sum{i in 1..250} mat[i,Y];
param y_hat = y_tot/250;
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2;
var r_sq = 1 - error/ss_tot;
var adj_r_sq = r_sq - (1-r_sq)*(2/247);

display sse, error, y_hat, ss_tot, r_sq, coeffs, z;

#############################################################################

reset;
reset options;

option solver cplex;

data reg_data.dat;

var coeffs{1..10};
var z{1..10};

print "Lambda =", lambdas[11];

minimize sse: sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2 + sum{k in 1..10}lambdas[11]*z[k];
subject to abs_1 {j in 1..10}: z[j] >= coeffs[j];
subject to abs_2 {j in 1..10}: z[j] >= -coeffs[j];

solve;

var error = sum{i in 1..250} (sum{j in 1..10}coeffs[j]*mat[i,j] - mat[i, Y])^2;
param y_tot = sum{i in 1..250} mat[i,Y];
param y_hat = y_tot/250;
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2;
var r_sq = 1 - error/ss_tot;
var adj_r_sq = r_sq - (1-r_sq)*(2/247);

display sse, error, y_hat, ss_tot, r_sq, coeffs, z;