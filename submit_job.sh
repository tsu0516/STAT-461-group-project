#!/bin/bash
#SBATCH --job-name=1
#SBATCH --account=p32696
#SBATCH --partition=gengpu
#SBATCH --gres=gpu:h100:1
#SBATCH --mem=128G
#SBATCH --time=12:00:00
#SBATCH --output=job_output.out
#SBATCH --error=error.out

module purge

source /home/mru0861/miniconda3/etc/profile.d/conda.sh

conda activate /home/mru0861/miniconda3/envs/DR_GST

cd /home/mru0861/projects/DR-GST-ST

python main.py --dataset CaCS --model GCN --labelrate 3 --s 3 --t 0.5 --b 0.1 --drop_method dropout --droprate 0.3

