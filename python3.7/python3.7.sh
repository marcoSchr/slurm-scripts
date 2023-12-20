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
LD_RUN_PATH="/ukp-storage-1/schroeder_e/sqlite/usr/lib" ./configure LDFLAGS="-L/ukp-storage-1/schroeder_e/sqlite/usr/lib" CPPFLAGS="-I/ukp-storage-1/schroeder_e/sqlite/usr/include"
LD_RUN_PATH="/ukp-storage-1/schroeder_e/sqlite/usr/lib" make -j 40
ln -s ../pyconfig.h Include/
