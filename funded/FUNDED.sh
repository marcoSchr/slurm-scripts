#!/bin/bash
#
#SBATCH --job-name=funded_setup
#SBATCH --output=/ukp-storage-1/schroeder_e/funded_setup.txt
#SBATCH --mail-user=marco.schroeder@stud.tu-darmstadt.de
#SBATCH --mail-type=ALL
#SBATCH --account=tk-student
#SBATCH --partition=gpu-tk
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=16GB
#SBATCH --gres=gpu:1

mkdir -p /ukp-storage-1/schroeder_e/FUNDED/
python -m venv /ukp-storage-1/schroeder_e/FUNDED/venv
source /ukp-storage-1/schroeder_e/FUNDED/venv/bin/activate
module load cuda/10.0
cd /ukp-storage-1/schroeder_e/FUNDED
git clone git@github.com:HuantWang/FUNDED_NISL.git
cd FUNDED_NISL
pip install -r requirements.txt
cd FUNDED/cli
CUDA_VISIBLE_DEVICES=2 python train.py GGNN GraphBinaryClassification ../data/data/CWE-77
