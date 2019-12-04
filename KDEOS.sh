java -jar elki.jar KDDCLIApplication -dbc.in 'data-ready.csv' -algorithm 'outlier.lof.KDEOS' -kdeos.k.min 1 -kdeos.k.max 100 | grep -v '^#' | awk '{print $NF}' | head -n 2499 > ./results/KDE    OS/result-${i}.csv; 

