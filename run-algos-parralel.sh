#!/bin/bash

outlier () {
	java -jar elki.jar KDDCLIApplication -dbc.in 'data-ready.csv' -algorithm 'outlier.distance.KNNOutlier' -knno.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n 2499 > ./results/merged/result-KNN-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in 'data-ready.csv' -algorithm 'outlier.distance.KNNWeightOutlier' -knnwod.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n 2499 > ./results/merged/result-KNNW-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in 'data-ready.csv' -algorithm 'outlier.lof.LOF' -lof.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n 2499 > ./results/merged/result-LOF-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in 'data-ready.csv' -algorithm 'outlier.lof.SimplifiedLOF' -lof.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n 2499 > ./results/merged/result-SimplifiedLOF-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in 'data-ready.csv' -algorithm 'outlier.lof.LoOP' -loop.kcomp ${i} | grep -v '^#' | awk '{print $NF}' | head -n 2499 > ./results/merged/result-LoOP-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in 'data-ready.csv' -algorithm 'outlier.lof.LDOF' -ldof.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n 2499 > ./results/merged/result-LDOF-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in 'data-ready.csv' -algorithm 'outlier.distance.ODIN' -odin.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n 2499 > ./results/merged/result-ODIN-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in 'data-ready.csv' -algorithm 'outlier.anglebased.FastABOD' -fastabod.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n 2499 > ./results/merged/result-FastABOD-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in 'data-ready.csv' -algorithm 'outlier.lof.INFLO' -inflo.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n 2499 > ./results/merged/result-INFLO-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in 'data-ready.csv' -algorithm 'outlier.lof.COF' -cof.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n 2499 > ./results/merged/result-COF-${i}.csv; 	
}


for i in {1..100}; do 

outlier "$run" & done

# java -jar elki.jar KDDCLIApplication -dbc.in 'data-ready.csv' -algorithm 'outlier.lof.KDEOS' -kdeos.k.min 1 -kdeos.k.max 100 | grep -v '^#' | awk '{print $NF}' | head -n 2499 > ./results/merged/KDEOS/result-${i}.csv; 
# java -jar elki.jar KDDCLIApplication -dbc.in 'data-ready.csv' -algorithm 'outlier.lof.LDF' -ldf.k ${i} -ldf.h 1 | grep -v '^#' | awk '{print $NF}' | head -n 2499 > ./results/merged/result-LDF-${i}.csv; 
