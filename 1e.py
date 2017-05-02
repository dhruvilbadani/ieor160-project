n = 10

def get_predictions(beta, X):
	Y_pred = []
	for x in X:
		y_pred = 0
		for i in range(n):
			y_pred += beta[i] * x[i]
		Y_pred.append(y_pred)
	return Y_pred

def sse(beta, X, Y_actual):
	Y_pred = get_predictions(beta, X)
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

coeffs_given = [-59.6, -241.6, 535.1, 241.7, -844.9, 407.4, -224.3, 285.2, 762.4, 169.6]
print("SSE All 10: {0}".format(sse(coeffs_given, X, Y_actual)))

coeffs_part_a = [0, -153.335, 610.97, 0, 0, 0, 0, 0, 588.782, 188.019]
print("SSE Part A: {0}".format(sse(coeffs_part_a, X, Y_actual)))

coeffs_part_b = [0, -155.447, 597.687, 213.927, 0, 0, 0, 0, 600.31, 0]
print("SSE Part B: {0}".format(sse(coeffs_part_b, X, Y_actual)))

coeffs_part_c = [0, 0, 405.494, 0.000540696, 0, 0, 0, 0, 414.866, 23.1162]
print("SSE Part C: {0}".format(sse(coeffs_part_c, X, Y_actual)))

coeffs_part_d = [0, 0, 603.681, 200.878, -267.699, 0, 0, 0, 711.644, 0]
print("SSE Part D: {0}".format(sse(coeffs_part_d, X, Y_actual)))
