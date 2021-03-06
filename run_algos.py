#!/usr/bin/python

import pandas as pd
import numpy as np
import sys, getopt
import subprocess


def main(argv):
	inputfile = 'Shuttle_dataset_ready.csv'
	# outputfile = 'Shuttle_dataset_ready.csv'
	try:
		opts, args = getopt.getopt(argv,"hi:o:",["ifile=","ofile="])
	except getopt.GetoptError:
		print ('python run_algos.py -i <inputfile>')
		sys.exit(2)
	for opt, arg in opts:
		if opt == '-h':
			print ('python run_algos.py -i <inputfile>')
			sys.exit()
		elif opt in ("-i", "--ifile"):
			inputfile = arg
	
	df = pd.read_csv(inputfile,header=None)

	size = len(df)

	bashCommand = "./run-algos.sh -filename "+str(inputfile)+" -size "+str(size)
	process = subprocess.Popen(bashCommand.split(), stdout=subprocess.PIPE)
	output, error = process.communicate()


if __name__ == "__main__":
	main(sys.argv[1:])
