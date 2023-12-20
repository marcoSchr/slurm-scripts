#!/bin/bash
#
#SBATCH --job-name=python3.8
#SBATCH --output=/ukp-storage-1/schroeder_e/python3.8.txt
#SBATCH --mail-user=marco.schroeder@stud.tu-darmstadt.de
#SBATCH --mail-type=ALL
#SBATCH --account=tk-student
#SBATCH --partition=yolo
#SBATCH --qos=yolo
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=32GB

cd /ukp-storage-1/schroeder_e/
mkdir -p python3.8
cd python3.8
wget https://www.python.org/ftp/python/3.8.18/Python-3.8.18.tgz
tar -xzvf Python-3.8.18.tgz
cd Python-3.8.18
LD_RUN_PATH="/ukp-storage-1/schroeder_e/sqlite/usr/lib" ./configure LDFLAGS="-L/ukp-storage-1/schroeder_e/sqlite/usr/lib" CPPFLAGS="-I/ukp-storage-1/schroeder_e/sqlite/usr/include"
LD_RUN_PATH="/ukp-storage-1/schroeder_e/sqlite/usr/lib" make -j 40
ln -s ../pyconfig.h Include/
