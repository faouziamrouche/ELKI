# ELKI Framework

A Python based framework to use ELKI's algorithms from the provided jar.

## Authors :
Faouzi Amrouche

## How to :

### 1. Pre-processing :
What it does : Ignores commented files (by default with '@') and deletes label (by default last column)
python pre-data.py -i <inputfile> -o <outputfile> (by default : inputfile = 'Shuttle_dataset.csv' and outputfile = 'Shuttle_dataset_ready.csv')

### 2. Running algorithms :
What it does : Runs the 11 algorithms ["COF","FastABOD","INFLO","KNN","KNNW","LDOF","LOF","LoOP","ODIN","SimplifiedLOF","KDEOS"] on the input data with variation of parameters (100 different values) and produces results under ./results/<ALGO> 
python pre-data.py -i <inputfile> (by default : inputfile = 'Shuttle_dataset.csv')

### 3. Combine results :
What it does : Pick n times random results and creates result files under results folder.
python concat.py -i <repetitions>

