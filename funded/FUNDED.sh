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
/ukp-storage-1/schroeder_e/python3.7/Python-3.7.17/python -m venv /ukp-storage-1/schroeder_e/FUNDED/venv
source /ukp-storage-1/schroeder_e/FUNDED/venv/bin/activate
module load cuda/10.0
cd /ukp-storage-1/schroeder_e/FUNDED
git clone https://github.com/HuantWang/FUNDED_NISL.git
cd FUNDED_NISL
pip install -r requirements.txt
pip install nni
cd /ukp-storage-1/schroeder_e/FUNDED
pip install gdown
gdowm https://drive.google.com/file/d/1yIH7-O5qNuGdWWw4gDCCtehqST3ofY6r
gdown https://drive.google.com/file/d/1pF8ca8zqUap4bv1bYMPZlBpOuzOTWJr6

