import os
import torch
import random
from dgl.data import CoauthorCSDataset

# 设置随机种子，确保可复现
random.seed(42)

# 加载数据
dataset = CoauthorCSDataset()
g = dataset[0]
labels = g.ndata['label']
n_classes = labels.max().item() + 1

# 参数
labelrate = 20
val_size = 500
test_size = 1000
dataset_name = 'CaCS'
path = f'data/{dataset_name}/'
os.makedirs(path, exist_ok=True)

# 初始化索引
train_idx = []

# 先按类别采样训练数据（20个每类）
for c in range(n_classes):
    cls_idx = (labels == c).nonzero(as_tuple=True)[0].tolist()
    random.shuffle(cls_idx)
    train_idx += cls_idx[:labelrate]

# 构建全集索引，排除 train 中的样本
all_idx = set(range(len(labels)))
train_idx_set = set(train_idx)
remain_idx = list(all_idx - train_idx_set)
random.shuffle(remain_idx)

# 从剩余数据中采样 val 和 test
val_idx = remain_idx[:val_size]
test_idx = remain_idx[val_size:val_size + test_size]

# 写入文件
with open(os.path.join(path, f'train{labelrate}.txt'), 'w') as f:
    for i in train_idx:
        f.write(f"{i}\n")

with open(os.path.join(path, f'val{labelrate}.txt'), 'w') as f:
    for i in val_idx:
        f.write(f"{i}\n")

with open(os.path.join(path, f'test{labelrate}.txt'), 'w') as f:
    for i in test_idx:
        f.write(f"{i}\n")
