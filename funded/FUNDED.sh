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
python3 -m venv /ukp-storage-1/schroeder_e/FUNDED/venv
source /ukp-storage-1/schroeder_e/FUNDED/venv/bin/activate
module load cuda/10.0
cd /ukp-storage-1/schroeder_e/FUNDED
git clone https://github.com/HuantWang/FUNDED_NISL.git
cd FUNDED_NISL
# Replace tensorflow-gpu with tensorflow
# This is done because -gpu is no longer supported
sed -i 's/tensorflow-gpu==2.0.0/tensorflow/g' requirements.txt
pip install -r requirements.txt
cd FUNDED/cli
CUDA_VISIBLE_DEVICES=2 python3 train.py GGNN GraphBinaryClassification ../data/data/CWE-77
