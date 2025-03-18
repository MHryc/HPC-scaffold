#!/bin/bash
#SBATCH --job-name="JobName"
#SBATCH --error="%A_%a.err"
#SBATCH --output="%A_%a.out"

#SBATCH --nodes=1
#SBATCH --time=01:00:00
#SBATCH -p standard
#SBATCH --ntasks-per-node=1
#SBATCH --mem=32GB

# array paralelization for multiple files
#SBATCH --array=1

##SBATCH --cpus-per-task=16

$SLURM_SUBMIT_DIR

CONFIG="${SLURM_SUBMIT_DIR}/config_array.tsv"
INFILE=$(awk -v TASK_ID=$SLURM_ARRAY_TASK_ID '$1 == TASK_ID {print $2}' $CONFIG)


### Define paths
PARTITION="scratch"
WORK_DIR="~/pl0217-01/${PARTITION}/4_MHryc"
export CONTAINERS="~/pl0217-01/project_data/4_MHryc/containers"

############




### Load modules
module load abyss

############

### Computation script
srun abyss-pe j=$SLURM_CPUS_PER_TASK
