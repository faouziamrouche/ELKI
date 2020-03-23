#!/bin/bash
for i in {1..30}; do 
	> ./results/COF/result-$i.csv
	> ./results/FastABOD/result-$i.csv
	> ./results/INFLO/result-$i.csv
	> ./results/KDEOS/result-$i.csv
	> ./results/KNN/result-$i.csv
	> ./results/KNNW/result-$i.csv
	> ./results/LDOF/result-$i.csv
	> ./results/LOF/result-$i.csv
	> ./results/LoOP/result-$i.csv
	> ./results/ODIN/result-$i.csv
	> ./results/SimplifiedLOF/result-$i.csv
done
