# Repeat analysis and gene prediction pipeline

Format assemblies to have short contig names post-Pilon polish

Commands [here]()

## Repeat modeler and masker

I modified the pipeline made by Verena Kutchera, at the National Bioinformatics Infrastructure Sweden (NBIS), to only run the part involving repeat analysis. 

The complete pipeline in Snakemake format can be found [here](https://bitbucket.org/scilifelab-lts/genemark_fungal_annotation/)

The modified Snakefile to run only the repeat analysis pipeline can be found [here]() 

Pipeline in brief:

* De novo prediction of repeat and transposable elements with [RepeatModeler v1.0.8](https://www.repeatmasker.org/RepeatModeler/)
* Repeat library used to mask the genome assembly with [RepeatMasker v4.0.7]()  


## Gene prediction





