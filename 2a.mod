reset;
reset options;

option solver cplex;

data reg_data.dat;

var coeffs{1..10};
var coeffs_second_order{j in 1..10, k in j..10};
var z_coeffs{1..10};
var z_coeffs_second_order{j in 1..10, k in j..10};

print "Lambda =", lambda_part_2;

minimize sse: sum{i in 1..250} (sum{j in 1..10}(coeffs[j]*mat[i,j]) + sum{j in 1..10, k in j..10}(mat[i, j] * mat[i, k] * coeffs_second_order[j,k]) - mat[i, Y])**2 + sum{k in 1..10}lambda_part_2*z_coeffs[k] + sum{j in 1..10, k in j..10} lambda_part_2*z_coeffs_second_order[j,k];
subject to abs_1 {j in 1..10}: z_coeffs[j] >= coeffs[j];
subject to abs_2 {j in 1..10}: z_coeffs[j] >= -coeffs[j];
subject to abs_3{j in 1..10, k in j..10}: z_coeffs_second_order[j,k] >= coeffs_second_order[j,k];
subject to abs_4{j in 1..10, k in j..10}: z_coeffs_second_order[j,k] >= -coeffs_second_order[j,k];
solve;

var error = sum{i in 1..250} (sum{j in 1..10}(coeffs[j]*mat[i,j]) + sum{j in 1..10, k in j..10}(mat[i, j] * mat[i, k] * coeffs_second_order[j,k]) - mat[i, Y])^2;
param y_tot = sum{i in 1..250} mat[i,Y];
param y_hat = y_tot/250;
param ss_tot = sum{i in 1..250}(mat[i,Y] - y_hat)^2;
var r_sq = 1 - error/ss_tot;
var adj_r_sq = r_sq - (1-r_sq)*(2/247);

display sse, error, y_hat, ss_tot, r_sq, coeffs, coeffs_second_order;