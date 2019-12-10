#!/bin/bash

outlier () {
	java -jar elki.jar KDDCLIApplication -dbc.in ${2:-Shuttle_dataset_ready.csv} -algorithm 'outlier.distance.KNNOutlier' -knno.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n ${size:-2499} > ./results/merged/result-KNN-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in ${2:-Shuttle_dataset_ready.csv} -algorithm 'outlier.distance.KNNWeightOutlier' -knnwod.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n ${size:-2499} > ./results/merged/result-KNNW-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in ${2:-Shuttle_dataset_ready.csv} -algorithm 'outlier.lof.LOF' -lof.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n ${size:-2499} > ./results/merged/result-LOF-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in ${2:-Shuttle_dataset_ready.csv} -algorithm 'outlier.lof.SimplifiedLOF' -lof.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n ${size:-2499} > ./results/merged/result-SimplifiedLOF-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in ${2:-Shuttle_dataset_ready.csv} -algorithm 'outlier.lof.LoOP' -loop.kcomp ${i} | grep -v '^#' | awk '{print $NF}' | head -n ${size:-2499} > ./results/merged/result-LoOP-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in ${2:-Shuttle_dataset_ready.csv} -algorithm 'outlier.lof.LDOF' -ldof.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n ${size:-2499} > ./results/merged/result-LDOF-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in ${2:-Shuttle_dataset_ready.csv} -algorithm 'outlier.distance.ODIN' -odin.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n ${size:-2499} > ./results/merged/result-ODIN-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in ${2:-Shuttle_dataset_ready.csv} -algorithm 'outlier.anglebased.FastABOD' -fastabod.k ${j} | grep -v '^#' | awk '{print $NF}' | head -n ${size:-2499} > ./results/merged/result-FastABOD-${j}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in ${2:-Shuttle_dataset_ready.csv} -algorithm 'outlier.lof.INFLO' -inflo.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n ${size:-2499} > ./results/merged/result-INFLO-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in ${2:-Shuttle_dataset_ready.csv} -algorithm 'outlier.lof.COF' -cof.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n ${size:-2499} > ./results/merged/result-COF-${i}.csv;
	java -jar elki.jar KDDCLIApplication -dbc.in ${2:-Shuttle_dataset_ready.csv} -algorithm 'outlier.lof.KDEOS' -kdeos.k.min 3 -kdeos.k.max ${j} | grep -v '^#' | awk '{print $NF}' | head -n ${size:-2499} > ./results/merged/result-KDEOS-${j}.csv; 

}

size=$(cat ${2:-Shuttle_dataset_ready.csv} | wc -l)
for i in {1..100}; do 
j=$(($i + 3))
outlier "$run" & done

# java -jar elki.jar KDDCLIApplication -dbc.in ${2:-Shuttle_dataset_ready.csv} -algorithm 'outlier.lof.LDF' -ldf.k ${i} -ldf.h 1 | grep -v '^#' | awk '{print $NF}' | head -n ${size:-2499} > ./results/merged/result-LDF-${i}.csv; 