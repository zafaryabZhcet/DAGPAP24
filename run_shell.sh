#!/bin/bash
#SBATCH --job-name=comp               
#SBATCH --partition=gpu               
#SBATCH --mail-user=zafaryab.haider@maine.edu  
#SBATCH --mem=100gb   
#SBATCH --output=log/run_check_SC15b_%j.log         
# SBATCH --gres=gpu:a100:2
#SBATCH --gres=gpu:a30:3

module load apptainer
echo "Running Script"
# export PYTORCH_CUDA_ALLOC_CONF="max_split_size_mb:128"
# apptainer run --nv competition.simg python -m src.eval_f1 --true_labels_file train_data.parquet --pred_file predictions.parquet
apptainer run --nv --env https_proxy=http://proxy.its.maine.edu:3128 competition1.simg python -m src.ml_gen_detection.dagpap24_baseline
# apptainer run --nv competition.simg python parquet_analyse.py