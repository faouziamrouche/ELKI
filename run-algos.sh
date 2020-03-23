#!/bin/bash

outlier () {
	java -jar elki.jar KDDCLIApplication -dbc.in $1 -algorithm 'outlier.distance.KNNOutlier' -knno.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n $size > ./results/KNN/result-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in $1 -algorithm 'outlier.distance.KNNWeightOutlier' -knnwod.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n $size > ./results/KNNW/result-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in $1 -algorithm 'outlier.lof.LOF' -lof.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n $size > ./results/LOF/result-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in $1 -algorithm 'outlier.lof.SimplifiedLOF' -lof.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n $size > ./results/SimplifiedLOF/result-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in $1 -algorithm 'outlier.lof.LoOP' -loop.kcomp ${i} | grep -v '^#' | awk '{print $NF}' | head -n $size > ./results/LoOP/result-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in $1 -algorithm 'outlier.lof.LDOF' -ldof.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n $size > ./results/LDOF/result-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in $1 -algorithm 'outlier.distance.ODIN' -odin.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n $size > ./results/ODIN/result-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in $1 -algorithm 'outlier.anglebased.FastABOD' -fastabod.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n $size > ./results/FastABOD/result-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in $1 -algorithm 'outlier.lof.INFLO' -inflo.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n $size > ./results/INFLO/result-${i}.csv; 
	java -jar elki.jar KDDCLIApplication -dbc.in $1 -algorithm 'outlier.lof.COF' -cof.k ${i} | grep -v '^#' | awk '{print $NF}' | head -n $size > ./results/COF/result-${i}.csv;
	java -jar elki.jar KDDCLIApplication -dbc.in $1 -algorithm 'outlier.lof.KDEOS' -kdeos.k.min 3 -kdeos.k.max ${j} | grep -v '^#' | awk '{print $NF}' | head -n $size > ./results/KDEOS/result-${j}.csv; 

}
mkdir -p ./results/KNN/ ./results/KNNW/ ./results/LOF/ ./results/SimplifiedLOF/ ./results/LoOP/ ./results/LDOF/ ./results/ODIN/ ./results/FastABOD/ ./results/INFLO/ ./results/COF/ ./results/KDEOS/
size=$(cat $1 | wc -l)
for i in {5..7}; do
	echo $1 $size $i
# j=$(($i + 1))
outlier "$run" & done