#!/bin/bash
#SBATCH -N 1
#SBATCH --partition=batch
#SBATCH -J assembly
#SBATCH -o %x.%J.out
#SBATCH -e %x.%J.err
#SBATCH --mail-user=changzhi.wang@kaust.edu.sa
#SBATCH --mail-type=ALL
#SBATCH --time=12:00:00
#SBATCH --mem=200G
#SBATCH -c 16

#run the application:
module load megahit/1.2.9
name="ERR1713358"
megahit -1 "$name"_trim_paired_1.fastq.gz -2 "$name"_trim_paired_2.fastq.gz -o "$name"_megahit -t 16 
