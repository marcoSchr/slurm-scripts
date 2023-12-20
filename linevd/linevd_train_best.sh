#!/bin/bash
#
#SBATCH --job-name=linevd_train_best
#SBATCH --output=/ukp-storage-1/schroeder_e/linevd_train_best.txt
#SBATCH --mail-user=marco.schroeder@stud.tu-darmstadt.de
#SBATCH --mail-type=ALL
#SBATCH --account=tk-student
#SBATCH --partition=gpu-tk
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=16GB
#SBATCH --gres=gpu:1

export HOME=/ukp-storage-1/schroeder_e/
source /ukp-storage-1/schroeder_e/linevd/venv/bin/activate
module load cuda/10.0
cd /ukp-storage-1/schroeder_e/linevd/linevd
export PYTHONPATH=/ukp-storage-1/schroeder_e/linevd/linevd:$PYTHONPATH

python sastvd/scripts/train_best.py