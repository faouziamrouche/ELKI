#!/bin/bash

for i in {1..100}; do 
	java -jar elki.jar KDDCLIApplication -dbc.in 'data-ready.csv' -algorithm 'outlier.distance.KNNOutlier' -knno.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n 2499 > ./results/KNN/result-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in 'data-ready.csv' -algorithm 'outlier.distance.KNNWeightOutlier' -knnwod.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n 2499 > ./results/KNNW/result-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in 'data-ready.csv' -algorithm 'outlier.lof.LOF' -lof.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n 2499 > ./results/LOF/result-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in 'data-ready.csv' -algorithm 'outlier.lof.SimplifiedLOF' -lof.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n 2499 > ./results/SimplifiedLOF/result-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in 'data-ready.csv' -algorithm 'outlier.lof.LoOP' -loop.kcomp ${i} | grep -v '^#' | awk '{print $NF}' | head -n 2499 > ./results/LoOP/result-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in 'data-ready.csv' -algorithm 'outlier.lof.LDOF' -ldof.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n 2499 > ./results/LDOF/result-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in 'data-ready.csv' -algorithm 'outlier.distance.ODIN' -odin.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n 2499 > ./results/ODIN/result-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in 'data-ready.csv' -algorithm 'outlier.anglebased.FastABOD' -fastabod.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n 2499 > ./results/FastABOD/result-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in 'data-ready.csv' -algorithm 'outlier.lof.LDF' -ldf.k ${i} -ldf.h 1 | grep -v '^#' | awk '{print $NF}' | head -n 2499 > ./results/LDF/result-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in 'data-ready.csv' -algorithm 'outlier.lof.INFLO' -inflo.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n 2499 > ./results/INFLO/result-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in 'data-ready.csv' -algorithm 'outlier.lof.COF' -cof.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n 2499 > ./results/COF/result-${i}.csv; 	
done
