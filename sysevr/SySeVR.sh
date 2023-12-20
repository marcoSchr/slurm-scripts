#!/bin/bash
#
#SBATCH --job-name=sysevr_setup
#SBATCH --output=/ukp-storage-1/schroeder_e/sysevr_setup.txt
#SBATCH --mail-user=marco.schroeder@stud.tu-darmstadt.de
#SBATCH --mail-type=ALL
#SBATCH --account=tk-student
#SBATCH --partition=gpu-tk
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=16GB
#SBATCH --gres=gpu:1

mkdir -p /ukp-storage-1/schroeder_e/SySeVR/
python2 -m venv /ukp-storage-1/schroeder_e/SySeV/venv
source /ukp-storage-1/schroeder_e/SySeV/venv/bin/activate
module load cuda/10.0
cd /ukp-storage-1/schroeder_e/SySeV
git clone https://github.com/SySeVR/SySeVR.git
cd SySeVR
cd /ukp-storage-1/schroeder_e/SySeVR/SySeVR/SySeVR_docker/docker_build/home/SySeVR/softdir/py2neo-py2neo-2.0 
python2 setup.py install
cd /ukp-storage-1/schroeder_e/SySeVR/SySeVR/SySeVR_docker/docker_build/home/SySeVR/softdir/python-joern-0.3.1
python2 setup.py install
# TODO: install python 3 and other dependencies
