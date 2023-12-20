#!/bin/bash
#
#SBATCH --job-name=linevul_ablation3
#SBATCH --output=/ukp-storage-1/schroeder_e/linevul_ablation3.txt
#SBATCH --mail-user=marco.schroeder@stud.tu-darmstadt.de
#SBATCH --mail-type=ALL
#SBATCH --account=tk-student
#SBATCH --partition=gpu-tk
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=16GB
#SBATCH --gres=gpu:1

source /ukp-storage-1/schroeder_e/LineVul/venv/bin/activate
module load cuda/10.0
cd /ukp-storage-1/schroeder_e/LineVul/linevul
python linevul_main.py \
  --model_name=WordlevelPretrainedBERT.bin \
  --output_dir=./saved_models \
  --model_type=roberta \
  --tokenizer_name=microsoft/codebert-base \
  --model_name_or_path=microsoft/codebert-base \
  --do_test \
  --train_data_file=../data/big-vul_dataset/train.csv \
  --eval_data_file=../data/big-vul_dataset/val.csv \
  --test_data_file=../data/big-vul_dataset/test.csv \
  --block_size 512 \
  --eval_batch_size 512  2>&1 | tee ablation3.log
