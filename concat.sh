#!/bin/bash

concat () {
	str="COF FastABOD INFLO KNN KNNW LDF LDOF LOF LoOP ODIN SimplifiedLOF"; # Only one file for KDEOS 
	
	for j in $str; do 
	# echo $j;
	COF=$(ls ./results/merged | grep 'COF' | sort -R | head -n 1);
	FastABOD=$(ls ./results/merged | grep 'FastABOD' | sort -R | head -n 1);
	INFLO=$(ls ./results/merged | grep 'INFLO' | sort -R | head -n 1);
	KNN=$(ls ./results/merged | grep 'KNN' | sort -R | head -n 1);
	KNNW=$(ls ./results/merged | grep 'KNNW' | sort -R | head -n 1);
	LDF=$(ls ./results/merged | grep 'LDF' | sort -R | head -n 1);
	LDOF=$(ls ./results/merged | grep 'LDOF' | sort -R | head -n 1);
	LOF=$(ls ./results/merged | grep 'LOF' | sort -R | head -n 1);
	LoOP=$(ls ./results/merged | grep 'LoOP' | sort -R | head -n 1);
	ODIN=$(ls ./results/merged | grep 'ODIN' | sort -R | head -n 1);
	SimplifiedLOF=$(ls ./results/merged | grep 'SimplifiedLOF' | sort -R | head -n 1);

	# paste ./results/results-$i.csv ./results/merged/$x > ./results/results-$i.csv
	paste -d ',' ./results/merged/$COF ./results/merged/$FastABOD ./results/merged/$INFLO ./results/merged/$KNN ./results/merged/$KNNW ./results/merged/$LDF ./results/merged/$LDOF ./results/merged/$LOF ./results/merged/$LoOP ./results/merged/$ODIN ./results/merged/$SimplifiedLOF > ./results/results-$i.csv
	# echo $x
	done
	}


for i in {1..30}; do concat "$run" & done


# for i in {1..30}; do 
# 	> ./results/results-$i.csv
# done
