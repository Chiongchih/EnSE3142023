#!/bin/bash
#SBATCH -N 1
#SBATCH --partition=batch
#SBATCH -J GTDB
#SBATCH -o %x.%J.out
#SBATCH -e %x.%J.err
#SBATCH --mail-user=changzhi.wang@kaust.edu.sa
#SBATCH --mail-type=ALL
#SBATCH --time=2:00:00
#SBATCH --mem=300G

#run the application:
filename="ERR1713378" 
#MAGs for GTDB must ended by .fna
module load gtdb-tk/1.3.0/python3.6
#export GTDBTK_DATA_PATH=/ibex/reference/KSL/gtdb-tk/release95/release95
export GTDBTK_DATA_PATH=/ibex/ai/reference/KSL/gtdb-tk/release95/release95

for f in ./"$filename"_metawrap_refine/metawrap_70_10_bins/*.fa; do mv -- "$f" "${f%.fa}.fna"; done
gtdbtk classify_wf --genome_dir ./"$filename"_metawrap_refine/metawrap_70_10_bins/ --out_dir "$filename"_GTDB/
for f in ./"$filename"_metawrap_refine/metawrap_70_10_bins/*.fna; do mv -- "$f" "${f%.fna}.fa"; done
mkdir "$filename"_metawrap_refine_results
cp ./"$filename"_metawrap_refine/metawrap_70_10_bins.stats ./"$filename"_metawrap_refine_results/
cp -r ./"$filename"_metawrap_refine/figures ./"$filename"_metawrap_refine_results/
cp -r ./"$filename"_metawrap_refine/metawrap_70_10_bins ./"$filename"_metawrap_refine_results/


