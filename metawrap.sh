#!/bin/bash
#SBATCH -N 1
#SBATCH --partition=batch
#SBATCH -J Metawrap78
#SBATCH -o %x.%J.out
#SBATCH -e %x.%J.err
#SBATCH --mail-user=changzhi.wang@kaust.edu.sa
#SBATCH --mail-type=ALL
#SBATCH --time=24:00:00
#SBATCH --mem=100G
#SBATCH -c 64


#run the application:
module load bowtie2/2.3.5
module load metawrap/1.3
module load anvio/7.1
module load miniconda3/4.7.12.1
module load samtools/1.12

filename="ERR1713378"
anvi-script-reformat-fasta ./"$filename"_megahit/final.contigs.fa -o "$filename".reformat_contigs.fa -l 1000 --simplify-names
gunzip "$filename"_trim_paired_1.fastq.gz
gunzip "$filename"_trim_paired_2.fastq.gz
metawrap binning -o "$filename"_metawrap -t 64 -a "$filename".reformat_contigs.fa --metabat2 --maxbin2 "$filename"_trim_paired_*.fastq
#gzip "$filename"_tr"im_paired_1.fastq
#gzip "$filename"_trim_paired_2.fastq
metawrap bin_refinement -o "$filename"_metawrap_refine -t 64 -A ./"$filename"_metawrap/metabat2_bins/ -B ./"$filename"_metawrap/maxbin2_bins/ -c 70 -x 10


