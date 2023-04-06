#!/usr/bin/env bash
#SBATCH --qos=np
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --job-name=gl
#SBATCH --mem=16gb
#SBATCH -t 00:05:00

# Executable

/ec/res4/scratch/nkac/hm_home/BL2_n0_2500m/bin/gl -nc /ec/res4/scratch/nkac/hm_home/BL2_n0_2500m/output/ICMSHHARM032022070106 -o /ec/res4/scratch/nkac/hm_home/BL2_n0_2500m/output/nc03_202207 -n /ec/res4/scratch/nkac/hm_home/BL2_n0_2500m/output/mergedim

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

