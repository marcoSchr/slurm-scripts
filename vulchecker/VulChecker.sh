#!/bin/bash
#
#SBATCH --job-name=vulchecker_setup
#SBATCH --output=/ukp-storage-1/schroeder_e/vulchecker_setup.txt
#SBATCH --mail-user=marco.schroeder@stud.tu-darmstadt.de
#SBATCH --mail-type=ALL
#SBATCH --account=tk-student
#SBATCH --partition=gpu-tk
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=16GB
#SBATCH --gres=gpu:1

mkdir -p /ukp-storage-1/schroeder_e/VulChecker/
python -m venv /ukp-storage-1/schroeder_e/VulChecker/venv
source /ukp-storage-1/schroeder_e/VulChecker/venv/bin/activate
module load cuda/10.0
cd /ukp-storage-1/schroeder_e/VulChecker
git clone https://github.com/ymirsky/VulChecker.git
git clone https://github.com/gtri/structure2vec.git
pip install -U pip setuptools wheel
pip install cython cmake
pip install ./structure2vec
pip --no-cache-dir install ./VulChecker
# Install LLVM
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/llvm-project-10.0.0.tar.xz
tar xvf llvm-project-10.0.0.tar.xz
mv llvm-project-10.0.0 llvm-project
git clone https://github.com/michaelbrownuc/llap.git
cp -R llap/src/* llvm-project/llvm/lib/Transforms/
cd llvm-project/
cmake -S ./llvm/ -B llvm-build -DCMAKE_BUILD_TYPE=Release
make -C llvm-build -j 16
# TODO: fix install folder
# make -C llvm-build install 
cmake -S ./clang/ -B clang-build -DCMAKE_BUILD_TYPE=Release
make -C clang-build -j 16
# TODO: fix install folder
# make -C clang-build install