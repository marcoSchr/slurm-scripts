#!/bin/bash
#
#SBATCH --job-name=funded_test
#SBATCH --output=/ukp-storage-1/schroeder_e/funded_test.txt
#SBATCH --mail-user=marco.schroeder@stud.tu-darmstadt.de
#SBATCH --mail-type=ALL
#SBATCH --account=tk-student
#SBATCH --partition=gpu-tk
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=16GB
#SBATCH --gres=gpu:1

source /ukp-storage-1/schroeder_e/FUNDED/venv/bin/activate
module load cuda/10.0
cd /ukp-storage-1/schroeder_e/FUNDED
cd FUNDED_NISL/FUNDED/cli
CUDA_VISIBLE_DEVICES=2 python test.py GGNN GraphBinaryClassification ../data/data/data/cve/badall --storedModel_path "./trained_model/GGNN_GraphBinaryClassification__2023-02-01_05-36-00_f1 = 0.800_best.pkl"

