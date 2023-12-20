#!/bin/bash
#
#SBATCH --job-name=linevd_setup
#SBATCH --output=/ukp-storage-1/schroeder_e/linevd_setup.txt
#SBATCH --mail-user=marco.schroeder@stud.tu-darmstadt.de
#SBATCH --mail-type=ALL
#SBATCH --account=tk-student
#SBATCH --partition=gpu-tk
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=16GB
#SBATCH --gres=gpu:1

export HOME=/ukp-storage-1/schroeder_e/
mkdir -p /ukp-storage-1/schroeder_e/linevd/
/ukp-storage-1/schroeder_e/python3.7/Python-3.7.17/python -m venv /ukp-storage-1/schroeder_e/linevd/venv
source /ukp-storage-1/schroeder_e/linevd/venv/bin/activate
module load cuda/10.0
cd /ukp-storage-1/schroeder_e/linevd
# Download sources
git clone https://github.com/davidhin/linevd.git
git clone https://github.com/stanfordnlp/GloVe.git
wget https://github.com/ShiftLeftSecurity/joern/releases/latest/download/joern-install.sh
curl -L https://github.com/danmar/cppcheck/archive/refs/tags/2.5.tar.gz > cppcheck/cppcheck2.5.tar.gz
curl -L https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/rough-auditing-tool-for-security/rats-2.4.tgz > rats-2.4.tgz

# Build Glove
cd GloVe
make
cd ..

# Build cppcheck
tar -xzvf cppcheck2.5.tar.gz
cd cppcheck-2.5
mkdir -p build
cd build
cmake ..
cmake --build .
cd ../..

# Build RATS
tar -xzvf rats-2.4.tgz
cd rats-2.4
./configure
make
cd ..


# Install joern

printf 'Y\n/ukp-storage-1/schroeder_e/joern\nN\n\nN\n\n' | ./joern-install.sh --interactive


# Install python dependencies
cd linevd
pip install torch==1.9.0 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu102
pip install flawfinder
pip install -r requirements.txt
# Install torch_scatter as binary package, because we have no gcc7 to build it
pip install https://data.pyg.org/whl/torch-1.9.0%2Bcu102/torch_scatter-2.0.9-cp37-cp37m-linux_x86_64.whl
pip install dgl-cu102 -f https://data.dgl.ai/wheels/repo.html
pip install --global-option=build_ext \
            --global-option="-I/ukp-storage-1/schroeder_e/graphviz/usr/include/" \
            --global-option="-L/ukp-storage-1/schroeder_e/graphviz/usr/lib/" \
            pygraphviz==1.7
pip install nltk
python -c 'import nltk; nltk.download("punkt")'
cd ..
