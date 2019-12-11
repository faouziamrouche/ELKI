#!/bin/bash

outlier () {
	java -jar elki.jar KDDCLIApplication -dbc.in ${2:-Shuttle_dataset_ready.csv} -algorithm 'outlier.distance.KNNOutlier' -knno.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n ${size:-2499} > ./results/KNN/result-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in ${2:-Shuttle_dataset_ready.csv} -algorithm 'outlier.distance.KNNWeightOutlier' -knnwod.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n ${size:-2499} > ./results/KNNW/result-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in ${2:-Shuttle_dataset_ready.csv} -algorithm 'outlier.lof.LOF' -lof.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n ${size:-2499} > ./results/LOF/result-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in ${2:-Shuttle_dataset_ready.csv} -algorithm 'outlier.lof.SimplifiedLOF' -lof.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n ${size:-2499} > ./results/SimplifiedLOF/result-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in ${2:-Shuttle_dataset_ready.csv} -algorithm 'outlier.lof.LoOP' -loop.kcomp ${i} | grep -v '^#' | awk '{print $NF}' | head -n ${size:-2499} > ./results/LoOP/result-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in ${2:-Shuttle_dataset_ready.csv} -algorithm 'outlier.lof.LDOF' -ldof.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n ${size:-2499} > ./results/LDOF/result-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in ${2:-Shuttle_dataset_ready.csv} -algorithm 'outlier.distance.ODIN' -odin.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n ${size:-2499} > ./results/ODIN/result-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in ${2:-Shuttle_dataset_ready.csv} -algorithm 'outlier.anglebased.FastABOD' -fastabod.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n ${size:-2499} > ./results/FastABOD/result-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in ${2:-Shuttle_dataset_ready.csv} -algorithm 'outlier.lof.INFLO' -inflo.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n ${size:-2499} > ./results/INFLO/result-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in ${2:-Shuttle_dataset_ready.csv} -algorithm 'outlier.lof.COF' -cof.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n ${size:-2499} > ./results/COF/result-${i}.csv;
	java -jar elki.jar KDDCLIApplication -dbc.in ${2:-Shuttle_dataset_ready.csv} -algorithm 'outlier.lof.KDEOS' -kdeos.k.min 3 -kdeos.k.max ${j} | grep -v '^#' | awk '{print $NF}' | head -n ${size:-2499} > ./results/KDEOS/result-${j}.csv; 

}
mkdir -p ./results/KNN/ ./results/KNNW/ ./results/LOF/ ./results/SimplifiedLOF/ ./results/LoOP/ ./results/LDOF/ ./results/ODIN/ ./results/FastABOD/ ./results/INFLO/ ./results/COF/ ./results/KDEOS/
size=$(cat ${2:-Shuttle_dataset_ready.csv} | wc -l)
for i in {3..103}; do
j=$(($i + 1))
outlier "$run" & done

# java -jar elki.jar KDDCLIApplication -dbc.in ${2:-Shuttle_dataset_ready.csv} -algorithm 'outlier.lof.LDF' -ldf.k ${i} -ldf.h 1 | grep -v '^#' | awk '{print $NF}' | head -n ${size:-2499} > ./results/merged/result-LDF-${i}.csv; 