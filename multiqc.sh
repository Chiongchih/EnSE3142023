#!/bin/bash
#SBATCH -N 1
#SBATCH --partition=batch
#SBATCH -J multiqc
#SBATCH -o %x.%J.out
#SBATCH -e %x.%J.err
#SBATCH --mail-user=changzhi.wang@kaust.edu.sa
#SBATCH --mail-type=ALL
#SBATCH --time=3:00:00
#SBATCH --mem=30G
#SBATCH -c 16

#run the application:
module load multiqc

filename='ERR1713378'
###Change ERR**** into your datasets name###
multiqc ./