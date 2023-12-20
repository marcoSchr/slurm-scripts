#!/bin/bash
#
#SBATCH --job-name=ninja
#SBATCH --output=/ukp-storage-1/schroeder_e/ninja.txt
#SBATCH --mail-user=marco.schroeder@stud.tu-darmstadt.de
#SBATCH --mail-type=ALL
#SBATCH --account=tk-student
#SBATCH --partition=yolo
#SBATCH --qos=yolo
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1GB

cd /ukp-storage-1/schroeder_e/
mkdir -p ninja
cd ninja
wget https://github.com/ninja-build/ninja/releases/download/v1.11.1/ninja-linux.zip
python -m zipfile -e ninja-linux.zip .
chmod +x ninja
