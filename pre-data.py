#!/usr/bin/python

import pandas as pd
import numpy as np
import sys, getopt

def main(argv):
	inputfile = 'Shuttle_dataset.csv'
	outputfile = 'Shuttle_dataset_ready.csv'
	try:
		opts, args = getopt.getopt(argv,"hi:o:",["ifile=","ofile="])
	except getopt.GetoptError:
		print ('python pre-data.py -i <inputfile> -o <outputfile>')
		sys.exit(2)
	for opt, arg in opts:
		if opt == '-h':
			print ('python pre-data.py -i <inputfile> -o <outputfile>')
			sys.exit()
		elif opt in ("-i", "--ifile"):
			inputfile = arg
		elif opt in ("-o", "--ofile"):
			outputfile = arg
	df = pd.read_csv(inputfile,sep=',',comment='@',header=None)
	# df = df.drop(-1,axis = 1)
	df.drop(df.columns[len(df.columns)-1], axis=1, inplace=True)
	df.to_csv(outputfile,header=None)

if __name__ == "__main__":
	main(sys.argv[1:])
