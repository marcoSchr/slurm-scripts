#!/bin/bash
#
#SBATCH --job-name=linevul_rq1
#SBATCH --output=/ukp-storage-1/schroeder_e/rq1.txt
#SBATCH --mail-user=marco.schroeder@stud.tu-darmstadt.de
#SBATCH --mail-type=ALL
#SBATCH --account=tk-student
#SBATCH --partition=gpu-tk
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=16GB
#SBATCH --gres=gpu:1

source /ukp-storage-1/schroeder_e/LineVul/venv/bin/activate
module load cuda/10.0
cd /ukp-storage-1/schroeder_e/LineVul/bow_rf
mkdir -p saved_models
python rf_main.py  2>&1 | tee rq1.log
