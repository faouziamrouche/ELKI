#!/bin/bash

for i in {1..30}; do 
	for j in 'COF  FastABOD  INFLO  KDEOS  KNN  KNNW  LDF  LDOF  LOF  LoOP  ODIN  SimplifiedLOF'; do 
	var = $(ls ./results/merged | grep '$j' | sort -R | head -n 1);
	cat $var ./results/results-$i.csv > ./results/results-$i.csv
	done
done
