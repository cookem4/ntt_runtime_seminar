#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --time=20:00
#SBATCH --job-name mcooke_seminar
#SBATCH --output=mcooke_seminar_%j.txt
#SBATCH --mail-type=FAIL
module load NiaEnv/2019b
module load gcc
module load python
module load valgrind
# TODO Try to invoke the search space script with:
# 1. Large prime numbers ~1000
# 2. Numbers of the form 2^N + 1
#       -> What will happen to heap useage of LUT-based approaches
# 3. A number such that thread-level parallelization overtakes single-threaded N^2
python3 run_search_space.py 64 128 200 257 1000 1025 2000 2049
python3 plot_search_space.py
