#!/bin/bash
#SBATCH -N 1
#SBATCH --partition=batch
#SBATCH -J trimm
#SBATCH -o %x.%J.out
#SBATCH -e %x.%J.err
#SBATCH --mail-user=changzhi.wang@kaust.edu.sa
#SBATCH --mail-type=ALL
#SBATCH --time=3-00:00:00
#SBATCH --mem=30G
#SBATCH -c 16

#run the application:
module load trimmomatic/0.38

filename='ERR1713378'
###Change ERR**** into your datasets name###
java -jar $TRIMMOMATIC_JAR PE -phred33 \
"$filename"_1.fastq.gz \
"$filename"_2.fastq.gz \
"$filename"_trim_paired_1.fastq.gz "$filename"_trim_unpaired_1.fastq.gz \
"$filename"_trim_paired_2.fastq.gz "$filename"_trim_unpaired_2.fastq.gz \
ILLUMINACLIP:adapters_2.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

