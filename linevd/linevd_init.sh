#!/bin/bash
#
#SBATCH --job-name=linevd_init
#SBATCH --output=/ukp-storage-1/schroeder_e/linevd_init.txt
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
cd storage/external

gdown https://drive.google.com/uc\?id\=1-0VhnHBp9IGh90s2wCNjeCMuy70HPl8X
python -m zipfile -e MSR_data_cleaned.zip .

wget https://github.com/joernio/joern/releases/download/v1.1.260/joern-cli.zip
python -m zipfile -e joern-cli.zip .
chmod -R +x joern-cli/
