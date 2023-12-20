#!/bin/bash
#
#SBATCH --job-name=sqlite
#SBATCH --output=/ukp-storage-1/schroeder_e/sqlite.txt
#SBATCH --mail-user=marco.schroeder@stud.tu-darmstadt.de
#SBATCH --mail-type=ALL
#SBATCH --account=tk-student
#SBATCH --partition=yolo
#SBATCH --qos=yolo
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=32GB

cd /ukp-storage-1/schroeder_e/
mkdir -p sqlite
cd sqlite
mkdir -p usr
wget https://www.sqlite.org/2023/sqlite-src-3430200.zip
unzip -o sqlite-src-3430200.zip
cd sqlite-src-3430200
./configure --prefix=/usr
make
make DESTDIR="/ukp-storage-1/schroeder_e/sqlite" install
