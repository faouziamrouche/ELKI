#!/usr/bin/python

import pandas as pd
import numpy as np
import sys, getopt
import os, random


algos=["COF","FastABOD","INFLO","KNN","KNNW","LDOF","LOF","LoOP","ODIN","SimplifiedLOF","KDEOS"]


def main(argv):
	repet=1
	try:
		opts, args = getopt.getopt(argv,"hi:o:",["ifile=","ofile="])
	except getopt.GetoptError:
		print ('python concat.py -i <repetitions>')
		sys.exit(2)
	for opt, arg in opts:
		if opt == '-h':
			print ('python concat.py -i <repetitions>')
			sys.exit()
		elif opt in ("-i"):
			repet = int(arg)
	for x in range(0,repet):
		li = []
		for i in algos:
			url = "./results/"+i+"/"
			filename = random.choice([x for x in os.listdir(url) if os.path.isfile(os.path.join(url, x))])
			df = pd.read_csv(url+filename, index_col=None, header=None)
			df.columns = [i]
			li.append(df)
		frame = pd.concat(li, axis=1)#, ignore_index=True)
		frame = frame.replace(regex=True, to_replace=["cof-outlier=","abod-outlier=","inflo-outlier=","knn-outlier=","knnw-outlier=","ldof-outlier=","lof-outlier=","loop-outlier=","odin=","simplified-=","kdeos-outlier="], value="")
		frame.to_csv('result-'+str(x+1)+'-.csv')

if __name__ == "__main__":
	main(sys.argv[1:])
