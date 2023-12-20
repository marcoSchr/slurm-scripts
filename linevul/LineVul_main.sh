#!/bin/bash
#
#SBATCH --job-name=linevul_train
#SBATCH --output=/ukp-storage-1/schroeder_e/linevul_main.txt
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
  --output_dir=./saved_models \
  --model_type=roberta \
  --tokenizer_name=microsoft/codebert-base \
  --model_name_or_path=microsoft/codebert-base \
  --do_train \
  --do_test \
  --train_data_file=../data/big-vul_dataset/train.csv \
  --eval_data_file=../data/big-vul_dataset/val.csv \
  --test_data_file=../data/big-vul_dataset/test.csv \
  --epochs 10 \
  --block_size 512 \
  --train_batch_size 16 \
  --eval_batch_size 16 \
  --learning_rate 2e-5 \
  --max_grad_norm 1.0 \
  --evaluate_during_training \
  --seed 123456  2>&1 | tee train.log
