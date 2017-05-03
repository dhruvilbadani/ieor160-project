n = 10
def get_predictions(beta,beta_matrix, X):
	Y_pred = []
	for x in X:
		y_pred = 0
		for i in range(n):
			y_pred += beta[i] * x[i]
		for i in range(n):
			for j in range(i,n):
				y_pred += beta_matrix[i][j]*x[i]*x[j]
		Y_pred.append(y_pred)
	return Y_pred

def sse(beta,beta_matrix, X, Y_actual):
	Y_pred = get_predictions(beta,beta_matrix, X)
	squared_differences = [(Y_actual[i] - Y_pred[i])**2 for i in range(len(Y_pred))]
	return sum(squared_differences)

def read_data(filename):
	X = []
	Y = []
	with open(filename) as f:
		lines = f.readlines()
		lines = lines[251:]
		for line in lines:
			if "AGE" in line:
				continue
			numbers = line.split()
			numbers = [float(number) for number in numbers]
			y = numbers[-1]
			x = numbers[0:-1]
			X.append(x)
			Y.append(y)

	
	return X, Y

X, Y_actual = read_data('data.txt')


coeffs_part_a = [-46.3591,-226.708, 534.415, 230.201, -316.992, -4.3493e-08, 12.5382, 204.877, 582.585, 160.929]
coeffs_part_a_matrix= [[1.09417e-06, 0.000102456, 1.09665e-07, 4.80696e-07, 1.91375e-08, -2.53955e-08, 1.98485e-08, 8.45594e-08, 3.59663e-07, 1.69066e-07],
[0,-1.80499e-08, 2.86425e-07, 4.22607e-07, 9.68603e-08, -2.63781e-10, -1.32483e-07, -3.07998e-08, 1.38711e-07, 7.5646e-08],
[0, 0, 1.46462e-07, 1.92339e-07, 6.51947e-08, 9.46737e-08, 7.90349e-08, 1.8639e-07, 8.70322e-08, 4.95379e-07],
[0,0, 0, 7.47294e-08,-1.63143e-08, -4.19059e-09, 2.81844e-08, 5.16799e-08, 5.4629e-08, 1.00506e-07],
[0,0,0,0,3.59483e-08,5.64592e-09, -6.18133e-08, -5.2328e-08, 5.35758e-08,7.07302e-08],
[0,0,0,0,0,-5.44664e-08, -8.03162e-09, -1.5056e-08, 1.33778e-07, 7.95601e-08],
[0,0,0,0,0,0,4.66955e-08, 3.47648e-08, -4.29466e-08, 8.84204e-08],
[0,0,0,0,0,0,0,4.1884e-08, -1.03307e-09, 2.61773e-07],
[0,0,0,0,0,0,0,0,-1.75994e-08, 2.13799e-07],
[0,0,0,0,0,0,0,0,0,102.204]]

print("SSE 2 Part A: {0}".format(sse(coeffs_part_a,coeffs_part_a_matrix, X, Y_actual)))							  				

coeffs_part_b = [0,-233.553, 595.908, 263.431, -327.887 ,0, 0, 242.18 ,561.239, 121.949]
coeffs_part_b_matrix= [[0,0,0, 3540.81, 0, 0, 0, 0, 0, 0],
[0, 0, 4250.64, 0, 0, 0, -3850.05,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0]]
print("SSE 2 Part B: {0}".format(sse(coeffs_part_b,coeffs_part_b_matrix, X, Y_actual)))

