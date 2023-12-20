#!/bin/bash
#
#SBATCH --job-name=linevul_create_mixed
#SBATCH --output=/ukp-storage-1/schroeder_e/linevul_create_mixed.txt
#SBATCH --mail-user=marco.schroeder@stud.tu-darmstadt.de
#SBATCH --mail-type=ALL
#SBATCH --account=tk-student
#SBATCH --partition=gpu-tk
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=16GB
#SBATCH --gres=gpu:1

source /ukp-storage-1/schroeder_e/LineVul/venv/bin/activate
module load cuda/10.0
cd /ukp-storage-1/schroeder_e/LineVul/
cd data
mkdir -p mixed_dataset
cd mixed_dataset
cp ../big-vul_dataset/* .
# Ensure all files end with a new line
echo "" >> test.csv
echo "" >> train.csv
echo "" >> val.csv
# Concatenate big vul with vpp
tail -n +2 ../vpp_dataset/test.csv >> test.csv
tail -n +2 ../vpp_dataset/train.csv >> train.csv
tail -n +2 ../vpp_dataset/val.csv >> val.csv
