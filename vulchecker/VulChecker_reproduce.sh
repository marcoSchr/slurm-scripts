#!/bin/bash
#
#SBATCH --job-name=vulchecker_reproduce
#SBATCH --output=/ukp-storage-1/schroeder_e/vulchecker_reproduce.txt
#SBATCH --mail-user=marco.schroeder@stud.tu-darmstadt.de
#SBATCH --mail-type=ALL
#SBATCH --account=tk-student
#SBATCH --partition=gpu-tk
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=16GB
#SBATCH --gres=gpu:1

export HOME=/ukp-storage-1/schroeder_e/
source /ukp-storage-1/schroeder_e/VulChecker/venv/bin/activate
module load cuda/10.0
cd /ukp-storage-1/schroeder_e/VulChecker
cd VulChecker/models/trained_on_aug_and_cve/

for f in ./*.zip
do
    python -m zipfile -e $f .
done

for folder in ./*/
do
    cd $folder
        hector stats \
        --dump ${folder}-testset.npz \
        --roc-file ${folder}_roc.pdf \
        --predictions-csv ${folder}-testset.csv \
        ~/models/CWE121  \
        ~/proc_graphs/CWE121/combined/testset_clean_0.1.json 
    cd ..
done
