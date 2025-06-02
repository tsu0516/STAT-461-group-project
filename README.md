# DR-GST: Reproduction and Extension

This repository contains our group project for STAT 461 at Northwestern University.  
We reproduce the WWW 2022 paper:

**"Confidence May Cheat: Self-Training on Graph Neural Networks under Distribution Shift"**  
Paper link: [https://arxiv.org/abs/2201.11349](https://arxiv.org/abs/2201.11349)

In addition to faithfully reproducing the original experiments, we extend the work by evaluating the DR-GST framework on two additional datasets: **CaCS** and **ACom**. These datasets were selected to examine the performance of DR-GST under different distribution shift scenarios.

---

## Environment

To run this project, the following environment setup is recommended:

- python == 3.8.8  
- pytorch == 1.8.1  
- dgl -cuda11.1 == 0.6.1  
- networkx == 2.5  
- numpy == 1.20.2  

---

## How to Run

The main script is `main.py`, which accepts the following arguments:

```bash
python main.py --dataset dataset --m model --labelrate labelrate --s stage --t threshold --b beta --drop_method drop_method --droprate droprate

---

## How to Run

To prepare the CaCS and ACom datasets for DR-GST, we wrote two additional preprocessing scripts:

- `generate_masks(1).py`
- `generate_masks(2).py`

These scripts generate the training, validation, and test masks required by the DR-GST training framework.  
The resulting split files have already been saved in the `data/` folder.

> **Note:** There is no need to re-run the mask generation scripts unless you want to regenerate the splits from scratch.
