n_features = 10 # The number of features
n_train = 250 # The number of training samples

def get_predictions(beta, X):
	Y_pred = [] # List to store the predicitions
	for x in X: # Going through all the data
		y_pred = 0
		for i in range(n_features):
			y_pred += beta[i] * x[i] # simulating the dot product
		Y_pred.append(y_pred) # Adding the prediction to the list
	return Y_pred # Returning the list

def sse(beta, X, Y_actual):
	Y_pred = get_predictions(beta, X) # Getting the predictions
	squared_differences = [(Y_actual[i] - Y_pred[i])**2 for i in range(len(Y_pred))] # Calculating the sum of squared errors
	return sum(squared_differences) # Returning the SSE

def read_data(filename):
	X = [] # List to store all the data points
	Y = [] # List to store all the target variables
	with open(filename) as f: # Opening the file containing the data (NOT necessarily .dat)
		lines = f.readlines() # Reading all the lines in the file
		lines = lines[n_train + 1:] # Skipping the first n_train + 1 lines since we need out-of-sample error and the first line is just feature names
		for line in lines: # Going through all lines
			if "AGE" in line: # Checking if the word "AGE" is in the line 
				continue # Skipping if the word "AGE" is in the line because if it is, the line is just feature names, not an actual sample
			numbers = line.split() # Splitting the string
			numbers = [float(number) for number in numbers] # Converting strings to numbers
			y = numbers[-1] # Extracting the target variable
			x = numbers[0:-1] # Extracting the features
			X.append(x) # Adding the sample
			Y.append(y) # Adding the target variable
	return X, Y # returning the data points and target variables

X, Y_actual = read_data('data.txt') # Getting the data points as X and target variables as Y
# X[i] is the ith sample. X[i][j] is the jth feature of the ith sample
# Y[i] is the ith target variable

coeffs_given = [-59.6, -241.6, 535.1, 241.7, -844.9, 407.4, -224.3, 285.2, 762.4, 169.6] # The coefficients given to us
print("SSE All 10: {0}".format(sse(coeffs_given, X, Y_actual))) # The SSE using  the coefficients given

coeffs_part_a = [0, -153.335, 610.97, 0, 0, 0, 0, 0, 588.782, 188.019] # The coefficients from part (a)
print("SSE Part 1A: {0}".format(sse(coeffs_part_a, X, Y_actual))) # The SSE using  the coefficients from part (a)

coeffs_part_b = [0, -155.447, 597.687, 213.927, 0, 0, 0, 0, 600.31, 0] # The coefficients from part (b)
print("SSE Part 1B: {0}".format(sse(coeffs_part_b, X, Y_actual))) # The SSE using  the coefficients from part (b)

coeffs_part_c = [0, 0, 405.494, 0.000540696, 0, 0, 0, 0, 414.866, 23.1162] # The coefficients from part (c)
print("SSE Part 1C: {0}".format(sse(coeffs_part_c, X, Y_actual))) # The SSE using  the coefficients from part (c)

coeffs_part_d = [0, 0, 603.681, 200.878, -267.699, 0, 0, 0, 711.644, 0] # The coefficients from part (d)
print("SSE Part 1D: {0}".format(sse(coeffs_part_d, X, Y_actual))) # The SSE using  the coefficients from part (d)
