#!/bin/bash
#
#SBATCH --job-name=python3.7
#SBATCH --output=/ukp-storage-1/schroeder_e/python3.7.txt
#SBATCH --mail-user=marco.schroeder@stud.tu-darmstadt.de
#SBATCH --mail-type=ALL
#SBATCH --account=tk-student
#SBATCH --partition=yolo
#SBATCH --qos=yolo
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=32GB

cd /ukp-storage-1/schroeder_e/
mkdir -p python3.7
cd python3.7
wget https://www.python.org/ftp/python/3.7.17/Python-3.7.17.tgz
tar -xzvf Python-3.7.17.tgz
cd Python-3.7.17
./configure
make -j 40
