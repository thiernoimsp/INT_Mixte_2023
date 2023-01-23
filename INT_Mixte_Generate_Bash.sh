#!/bin/bash

cd /home/thierno/INT_Network_2023

# Store the arguments in variables
#path=$1
nodes=$1
items=$2
monitoring=$3
flows=($4)
percent=$5
min_capacity=$6
max_capacity=$7

# Create a folder to store the log files
mkdir -p Solution/logs/$1_$2_$3_$6_$7
log_folder=Solution/logs/$1_$2_$3_$6_$7

# Loop to run the script multiple times
for i in "${!flows[@]}"; do
    # Start a new detached screen session and run the python script
    screen -d -m sh -c "python3.7 INT_Mixte.py $nodes $items $monitoring ${flows[i]} $percent $min_capacity $max_capacity | tee ${log_folder}/INT_Mixte_$1_$2_$3_${flows[i]}_$5.log"
done


#chmod +x INT_Mixte_Generate_Bash.sh
#./INT_Mixte_Generate_Bash.sh [number nodes] [number items] [number monitoring application] "[50 10 150 200]" [percentage of given flows] [min_capacity] [max_capacity]
#./INT_Mixte_Generate_Bash.sh 50 8 4 "30 40 50" 100 2 8





