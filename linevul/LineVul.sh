#!/bin/bash
#
#SBATCH --job-name=linevul_setup
#SBATCH --output=/ukp-storage-1/schroeder_e/res.txt
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
cd /ukp-storage-1/schroeder_e/LineVul/
# Install requirements
pip install -r requirements.txt
# Get data
cd linevul
cd results
gdown https://drive.google.com/uc?id=1WqvMoALIbL3V1KNQpGvvTIuc3TL5v5Q8
cd ../..
cd data
cd big-vul_dataset
gdown https://drive.google.com/uc?id=1h0iFJbc5DGXCXXvvR6dru_Dms_b2zW4V
cd ../..
cd data
cd big-vul_dataset
gdown https://drive.google.com/uc?id=1ldXyFvHG41VMrm260cK_JEPYqeb6e6Yw
gdown https://drive.google.com/uc?id=1yggncqivMcP0tzbh8-8Eu02Edwcs44WZ
cd ../..
cd data
cd big-vul_dataset
gdown https://drive.google.com/uc?id=10-kjbsA806Zdk54Ax8J3WvLKGTzN8CMX
cd ../..
cd linevul
cd saved_models
cd checkpoint-best-f1
gdown https://drive.google.com/uc?id=1oodyQqRb9jEcvLMVVKILmu8qHyNwd-zH
cd ../../..
cd linevul
cd saved_models
cd checkpoint-best-f1
gdown https://drive.google.com/uc?id=1oodyQqRb9jEcvLMVVKILmu8qHyNwd-zH
cd ../../..
cd linevul
cd saved_models
cd checkpoint-best-f1
gdown https://drive.google.com/uc?id=1oodyQqRb9jEcvLMVVKILmu8qHyNwd-zH
cd ../../..
cd linevul
cd saved_models
cd checkpoint-best-f1
gdown https://drive.google.com/uc?id=1oodyQqRb9jEcvLMVVKILmu8qHyNwd-zH
cd ../../..
cd linevul
cd saved_models
cd checkpoint-best-f1
gdown https://drive.google.com/uc?id=1uABZ8lurt7YMI-3bgxH8qLbm0jWANNoo
cd ../../..
cd linevul
cd saved_models
cd checkpoint-best-f1
gdown https://drive.google.com/uc?id=1cXeaWeBCpBuY6gPkRft2tS7SnDZrBed-
cd ../../..
cd linevul
cd saved_models
cd checkpoint-best-f1
gdown https://drive.google.com/uc?id=1yTe42JK_Z5ZB9MHb4eIKIMu-uqH0fE_m
cd ../../..

