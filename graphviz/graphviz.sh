#!/bin/bash
#
#SBATCH --job-name=graphviz
#SBATCH --output=/ukp-storage-1/schroeder_e/graphviz.txt
#SBATCH --mail-user=marco.schroeder@stud.tu-darmstadt.de
#SBATCH --mail-type=ALL
#SBATCH --account=tk-student
#SBATCH --partition=yolo
#SBATCH --qos=yolo
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=32GB

cd /ukp-storage-1/schroeder_e/
mkdir -p graphviz
cd graphviz
wget -nc https://gitlab.com/api/v4/projects/4207231/packages/generic/graphviz-releases/9.0.0/graphviz-9.0.0.tar.gz
tar -xzvf graphviz-9.0.0.tar.gz
cd graphviz-9.0.0
export PKG_CONFIG_PATH=/ukp-storage-1/schroeder_e/expat/expat-2.5.0/lib/.libs
./autogen.sh
./configure --prefix=/usr --enable-python3=yes --enable-lefty
make -j 40
