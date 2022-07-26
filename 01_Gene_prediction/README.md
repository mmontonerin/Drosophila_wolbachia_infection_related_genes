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
