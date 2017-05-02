with open('data.txt', 'r') as f:
	with open('data_numbers.txt', 'w+') as f2:
		for i, line in enumerate(f):
			if i > 0:
				f2.write("{0} {1}".format(i, line))
			else:
				f2.write(line)