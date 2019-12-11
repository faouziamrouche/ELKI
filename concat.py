#!/usr/bin/python

import pandas as pd
import numpy as np
import sys, getopt
import os, random




def main(argv):
	algos=["COF","FastABOD","INFLO","KNN","KNNW","LDOF","LOF","LoOP","ODIN","SimplifiedLOF","KDEOS"]
	file2='Shuttle_dataset.csv'
	repet=1
	try:
		opts, args = getopt.getopt(argv,"hi:o:",["ifile=","ofile="])
	except getopt.GetoptError:
		print ('concat.py -i <repetitions> -f <inputfile>')
		sys.exit(2)
	for opt, arg in opts:
		if opt == '-h':
			print ('concat.py -i <repetitions> -f <inputfile>')
			sys.exit()
		elif opt in ("-i"):
			repet = int(arg)
		elif opt in ("-f"):
			file2= int(arg)
	for x in range(0,repet):
		li = []
		for i in algos:
			url = "./results/"+i+"/"
			filename = random.choice([x for x in os.listdir(url) if os.path.isfile(os.path.join(url, x))])
			df = pd.read_csv(url+filename, index_col=None, header=None)
			df.columns = [i]
			li.append(df)
		df = pd.read_csv(file2, comment='@', index_col=None, header=None)
		df = df[df.columns[-1]]
		li.append(df)
		frame = pd.concat(li, axis=1)#, ignore_index=True)
		frame = frame.replace(regex=True, to_replace=["cof-outlier=","abod-outlier=","inflo-outlier=","knn-outlier=","knnw-outlier=","ldof-outlier=","lof-outlier=","loop-outlier=","odin=","simplified-","kdeos-outlier="], value="")
		frame = frame.rename(columns={10: "label"})
		frame.to_csv('./results/result-'+str(x+1)+'.csv')

if __name__ == "__main__":
	main(sys.argv[1:])
