#!/bin/bash
#SBATCH -J gda
#SBATCH --mem=4G	         # Ask for 2 GB of RAM
#SBATCH --gres=gpu:0             # Number of GPUs (per node)
#SBATCH --time=8:00
#SBATCH --output=./out/%j-%x.out
#SBATCH --error=./err/%j-%x.err
#SBATCH --partition=mars-lab-short
#SBATCH --nodelist=cs-venus-13

iters=$1
run=$2
lrp=$3
lrl=$4
samples=$5
entropy=$6
cmdp=$7
path_name="./"
file_name="trainCartpole_GDA.py"
uv run python $path_name$file_name --num_iterations $iters --run $run --learning_rate_pol $lrp --learning_rate_lambd $lrl --num_samples $samples --entropy_coeff $entropy --cmdp $cmdp
