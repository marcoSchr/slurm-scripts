#!/bin/bash
#
#SBATCH --job-name=gcc7
#SBATCH --output=/ukp-storage-1/schroeder_e/gcc7.txt
#SBATCH --mail-user=marco.schroeder@stud.tu-darmstadt.de
#SBATCH --mail-type=ALL
#SBATCH --account=tk-student
#SBATCH --partition=yolo
#SBATCH --qos=yolo
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=32GB

cd /ukp-storage-1/schroeder_e/
mkdir -p gcc7/
cd gcc7/
wget https://ftp.gnu.org/gnu/gcc/gcc-7.5.0/gcc-7.5.0.tar.gz
tar -xzvf gcc-7.5.0.tar.gz
cd gcc-7.5.0
./configure
make BOOT_CFLAGS='-O' bootstrap
make all-gcc
