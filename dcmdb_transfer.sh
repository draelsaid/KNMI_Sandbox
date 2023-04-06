#!/usr/bin/env bash
#SBATCH --qos=np
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --job-name=gl
#SBATCH --mem=16gb
#SBATCH -t 10:00:00

# Executable

python3 /ec/res4/scratch/nkac/script.py
#python3 /perm/nkac/git/github/draelsaid/dcmdb/transfer5.py 

echo SLURM_NTASKS=$SLURM_NTASKS
echo $EC_TASKS_PER_NODE

# #  ( srun --exclusive --mem=500 -N 1 -n 1 --cpus-per-task=1  -l test.sh $task &> task_$task.log ) &
# set -x
# for task in $(seq 1 $SLURM_NTASKS); do 
# #  srun --exclusive --ntasks=1 --cpus-per-task=1 --mem-per-cpu=500 test.sh $task &> task_$task.log &
#   #srun --ntasks=1 --cpus-per-task=1 --mem-per-cpu=0 test.sh $task &> task_$task.log &
#   srun -n 1 --cpus-per-task=1 --mem-per-cpu=0 test.sh $task &> task_$task.log &
# done

sleep 15

wait

echo done with $0

