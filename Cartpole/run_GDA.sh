#!/bin/bash
#SBATCH -J gda
#SBATCH --mem=4G     	         # Ask for 2 GB of RAM
#SBATCH --gres=gpu:0             # Number of GPUs (per node)
#SBATCH --time=20:00
#SBATCH --output=./out/%j-%x.out
#SBATCH --error=./err/%j-%x.err
#SBATCH --partition=mars-lab-short
#SBATCH --nodelist=cs-venus-13
iters=$1
lrp=$2
lrl=$3
samples=$4
entropy=$5
cmdp=$6
path_name="./"
file_name="trainCartpole_GDA.py"

uv run python $path_name$file_name --num_iterations $iters --run 1 --learning_rate_pol $lrp --learning_rate_lambd $lrl --num_samples $samples --entropy_coeff $entropy --cmdp $cmdp
uv run python $path_name$file_name --num_iterations $iters --run 2 --learning_rate_pol $lrp --learning_rate_lambd $lrl --num_samples $samples --entropy_coeff $entropy --cmdp $cmdp
uv run python $path_name$file_name --num_iterations $iters --run 3 --learning_rate_pol $lrp --learning_rate_lambd $lrl --num_samples $samples --entropy_coeff $entropy --cmdp $cmdp
uv run python $path_name$file_name --num_iterations $iters --run 4 --learning_rate_pol $lrp --learning_rate_lambd $lrl --num_samples $samples --entropy_coeff $entropy --cmdp $cmdp
uv run python $path_name$file_name --num_iterations $iters --run 5 --learning_rate_pol $lrp --learning_rate_lambd $lrl --num_samples $samples --entropy_coeff $entropy --cmdp $cmdp
