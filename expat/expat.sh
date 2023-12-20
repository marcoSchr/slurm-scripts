#!/bin/bash
#
#SBATCH --job-name=expat
#SBATCH --output=/ukp-storage-1/schroeder_e/expat.txt
#SBATCH --mail-user=marco.schroeder@stud.tu-darmstadt.de
#SBATCH --mail-type=ALL
#SBATCH --account=tk-student
#SBATCH --partition=yolo
#SBATCH --qos=yolo
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=32GB

cd /ukp-storage-1/schroeder_e/
mkdir -p expat
cd expat
wget https://github.com/libexpat/libexpat/releases/download/R_2_5_0/expat-2.5.0.tar.gz
tar -xzvf expat-2.5.0.tar.gz
cd expat-2.5.0
cmake -B build
make VERBOSE=1 -C build
