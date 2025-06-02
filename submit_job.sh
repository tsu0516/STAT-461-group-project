#!/bin/bash
#SBATCH --job-name=dehualiu
#SBATCH --account=p32696
#SBATCH --partition=gengpu
#SBATCH --gres=gpu:h100:1
#SBATCH --mem=128G
#SBATCH --time=12:00:00
#SBATCH --output=job_output_M3S_ACom.out
#SBATCH --error=error_M3S_ACom.out

module purge

# 加载 conda 初始化脚本（路径需根据你环境调整）
source /home/mru0861/miniconda3/etc/profile.d/conda.sh

# 激活你的环境
conda activate /home/mru0861/miniconda3/envs/DR_GST

# 进入代码目录
cd /home/mru0861/projects/DR-GST-ST/baseline

# 运行主程序
#python main.py --dataset CaCS --model GCN --labelrate 3 --s 3 --t 0.5 --b 0.1 --drop_method dropout --droprate 0.3
# for rate in 3 5 10 20
# do
#   echo "Running labelrate=$rate"
#   python main.py --dataset CaCS --model GCN --labelrate $rate --drop_method dropout --droprate 0.3
# done

# for rate in 3 5 10 20
# do
#  echo "Running labelrate=$rate"
#  python main.py --dataset CaCS --model GCN --labelrate $rate --drop_method dropout --droprate 0.3
# done

# for rate in 3
# do
#     echo "Running labelrate=$rate"
#     python m3s.py --dataset Pubmed --model GCN --labelrate $rate
# done

for rate in 3 5 10 20
do
    echo "Running labelrate=$rate"
    python m3s.py --dataset ACom --model GCN --labelrate $rate
done
