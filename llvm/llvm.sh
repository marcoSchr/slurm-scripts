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
wget -nc https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/llvm-project-10.0.0.tar.xz
tar xkf llvm-project-10.0.0.tar.xz
mv llvm-project-10.0.0 llvm-project
git clone https://github.com/michaelbrownuc/llap.git
cp -R llap/src/* llvm-project/llvm/lib/Transforms/
cd llvm-project/
/ukp-storage-1/schroeder_e/cmake/cmake-3.27.7-linux-x86_64/bin/cmake -S ./llvm/ -B llvm-build -DCMAKE_BUILD_TYPE=Release
/ukp-storage-1/schroeder_e/cmake/cmake-3.27.7-linux-x86_64/bin/cmake --build llvm-build -j 40
/ukp-storage-1/schroeder_e/cmake/cmake-3.27.7-linux-x86_64/bin/cmake --install llvm-build --prefix /ukp-storage-1/schroeder_e/llvm/
LLVM_DIR=/ukp-storage-1/schroeder_e/llvm/llvm-project/llvm-build/lib/cmake/llvm/ /ukp-storage-1/schroeder_e/cmake/cmake-3.27.7-linux-x86_64/bin/cmake -S ./clang/ -B clang-build -DCMAKE_BUILD_TYPE=Release
/ukp-storage-1/schroeder_e/cmake/cmake-3.27.7-linux-x86_64/bin/cmake --build clang-build -j 40
/ukp-storage-1/schroeder_e/cmake/cmake-3.27.7-linux-x86_64/bin/cmake --install clang-build --prefix /ukp-storage-1/schroeder_e/llvm/
