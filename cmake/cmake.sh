#!/bin/bash
#
#SBATCH --job-name=cmake
#SBATCH --output=/ukp-storage-1/schroeder_e/cmake.txt
#SBATCH --mail-user=marco.schroeder@stud.tu-darmstadt.de
#SBATCH --mail-type=ALL
#SBATCH --account=tk-student
#SBATCH --partition=yolo
#SBATCH --qos=yolo
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=32GB

cd /ukp-storage-1/schroeder_e/
mkdir -p cmake
cd cmake
wget https://github.com/Kitware/CMake/releases/download/v3.27.7/cmake-3.27.7-linux-x86_64.tar.gz
tar -xzvf cmake-3.27.7-linux-x86_64.tar.gz
