#!/bin/bash
#
#SBATCH --job-name=llvm
#SBATCH --output=/ukp-storage-1/schroeder_e/llvm.txt
#SBATCH --mail-user=marco.schroeder@stud.tu-darmstadt.de
#SBATCH --mail-type=ALL
#SBATCH --account=tk-student
#SBATCH --partition=yolo
#SBATCH --qos=yolo
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=32GB

cd /ukp-storage-1/schroeder_e/
mkdir -p llvm
cd llvm
# Install LLVM
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/llvm-project-10.0.0.tar.xz
tar xvf llvm-project-10.0.0.tar.xz
mv llvm-project-10.0.0 llvm-project
git clone https://github.com/michaelbrownuc/llap.git
cp -R llap/src/* llvm-project/llvm/lib/Transforms/
cd llvm-project/
/ukp-storage-1/schroeder_e/cmake/cmake-3.27.7-linux-x86_64/bin/cmake -S ./llvm/ -B llvm-build -DCMAKE_BUILD_TYPE=Release
make -C llvm-build -j 16
make -C llvm-build install
LLVM_DIR=/ukp-storage-1/schroeder_e/llvm/llvm-project/llvm-build/lib/cmake/llvm/ /ukp-storage-1/schroeder_e/cmake/cmake-3.27.7-linux-x86_64/bin/cmake -S ./clang/ -B clang-build -DCMAKE_BUILD_TYPE=Release
make -C clang-build -j 16
make -C clang-build install
