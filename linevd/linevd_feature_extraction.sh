#!/bin/bash
#
#SBATCH --job-name=linevd_feature_extraction
#SBATCH --output=/ukp-storage-1/schroeder_e/linevd_feature_extraction.txt
#SBATCH --mail-user=marco.schroeder@stud.tu-darmstadt.de
#SBATCH --mail-type=ALL
#SBATCH --account=tk-student
#SBATCH --partition=gpu-tk
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=16GB
#SBATCH --gres=gpu:1

export HOME=/ukp-storage-1/schroeder_e/
export PATH=/ukp-storage-1/schroeder_e/linevd/rats/bin:$PATH
export PATH=/ukp-storage-1/schroeder_e/linevd/GloVe/build:$PATH
export PATH=/ukp-storage-1/schroeder_e/linevd/cppcheck/cppcheck-2.5/build/bin:$PATH
# Fake to be in singularity to run all processed directly
export SINGULARITY=true
source /ukp-storage-1/schroeder_e/linevd/venv/bin/activate
module load cuda/10.0
cd /ukp-storage-1/schroeder_e/linevd/linevd
export PYTHONPATH=/ukp-storage-1/schroeder_e/linevd/linevd:$PYTHONPATH

python -c 'import sastvd.helpers.datasets as svdd;svdd.bigvul(False)'
python sastvd/scripts/prepare.py
python sastvd/scripts/getgraphs.py 0
