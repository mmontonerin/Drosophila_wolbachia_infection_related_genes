# Repeat analysis and gene prediction pipeline

Format assemblies to have short contig names post-Pilon polish

```sed -i 's/_pilon//g' assembly.fasta```

## Repeat pipeline

I modified the pipeline made by Verena Kutchera, at the National Bioinformatics Infrastructure Sweden (NBIS), to only run the part involving repeat analysis.

The complete pipeline in Snakemake format can be found [here](https://bitbucket.org/scilifelab-lts/genemark_fungal_annotation/)

The modified Snakefile to run only the repeat analysis pipeline can be found [here](https://github.com/mmontonerin/Drosophila_wolbachia_infection_related_genes/blob/main/01_Gene_prediction/Snakefile_repeatpipeline_only), as well as the [configuration file](https://github.com/mmontonerin/Drosophila_wolbachia_infection_related_genes/blob/main/01_Gene_prediction/config_repeatpipeline_only.yaml), and the [cluster file](https://github.com/mmontonerin/Drosophila_wolbachia_infection_related_genes/blob/main/01_Gene_prediction/cluster_repeatpipeline_only.yaml). The Snakemake environment folders can be retreived from the original pipeline linked above.

##### Pipeline in brief:

* Change all lowercase bases to uppercase so the assembly is even before the repeat pipeline.
* De novo prediction of repeat and transposable elements with [RepeatModeler v1.0.8](https://www.repeatmasker.org/RepeatModeler/)
* Split the UniProt/Swissprot protein database into chunks for transposonPSI
* Identify transposons in the UniProt/Swissprot protein dataset
* Remove transposons from the UniProt/Swissprot protein dataset
* Generate BLAST database from filtered UniProt/Swissprot protein dataset
* Blastx repeat library to filtered Uniprot/Swissprot database
* Remove blast hits from repeat library so that non-transposable genes are removed from the repeat library
* Final repeat library used to mask the genome assembly with [RepeatMasker v4.0.7](http://www.repeatmasker.org/RepeatMasker/)  


## Gene prediction

### RNA mapping

For the samples with RNA sequencing data available (D. paulistorum), we produced first a RNA mapping to the final masked assembly.

* D. paulistorum O11 RNA data was used to map on the assemblies of D. paulistorum O11, MS, L12 and L06 (according to previous phylogenetic inferences)
* D. paulistorum A28 RNA data was used to map on the assemblies of D. paulistorum A28 and L06.

RNA alignment done with [STAR v2.7.9a](https://github.com/alexdobin/STAR/releases/tag/2.7.9a)

##### Index of genome assemblies
```
  #Example with D. paulistorum O11
  STAR --runThreadN 20 \
  --runMode genomeGenerate \
  --genomeSAindexNbases 12 \
  --genomeDir /path/annotation/O11_genomeDir \
  --genomeFastaFiles /path/annotation/assemblies/O11_polish_nextdenovo_masked.fasta
```
##### RNA mapping
```
STAR --runThreadN 20 \
--genomeDir /path/annotation/O11_genomeDir \
--readFilesCommand zcat \
--readFilesManifest /path/annotation/RNA_data/manifest_O11.txt \
--alignIntronMax 200000 \
--outFilterMultimapNmax 30 \
--outFileNamePrefix path/annotation/RNA_map/O11 \
--outSAMtype BAM SortedByCoordinate \
--limitBAMsortRAM 20000000000
```
**Notes**
* manifest_O11.txt is a file with the location of each of the RNA fastq files
```
/path/to/1_R1.fastq.gz /path/to/1_R2.fastq.gz ID_seq1
/path/to/2_R1.fastq.gz /path/to/2_R2.fastq.gz ID_seq2
...
```
* IntronMax selected based on previous proteome information in D. paulistorum.

### Gene prediction
