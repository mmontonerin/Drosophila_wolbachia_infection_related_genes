## Ortholog analysis

### Data preparation

##### Published proteomes
The proteome of D. melanogaster and D. willistoni was obtained from [Flybase.org](https://flybase.org/)

* D. melanogaster r6.46 FB2022 03    
* D. willistoni r1.3 FB2015 01

Both proteomes (and specially D. melanogaster) contain a big amount of alternative isoforms for each gene.

A [script](https://github.com/mmontonerin/Drosophila_wolbachia_infection_related_genes/blob/main/02_Ortholog_find_and_Phylogenetics/parsing_FB_translation_file.pl) produced by Guilherme Baião was used to only obtain the longest isoform for each gene from the translation fasta file of flybase.org, maintaining the gene number for further analysis that would require obtaining the information associated with each gene from flybase.org.

##### BRAKER output
Gene predictions in fasta format from the BRAKER pipeline were renamed with [the following commands](https://github.com/mmontonerin/Drosophila_wolbachia_infection_related_genes/blob/main/02_Ortholog_find_and_Phylogenetics/rename_braker_output_fasta_headers.sh) so that headers would contain a shorter version of the species name and an underscore, so that it can be parsed and reduced later in the pipeline, where some programs require short fasta headers.   

### Ortholog finder

[OrthoFinder v2.5.2](https://github.com/davidemms/OrthoFinder) was used for orthology inference between datasets.

`orthofinder.py -f /path/annotation/orthologues_all`

Where the folder `orthologues_all` contain each proteome fasta file.

OrthoFinder requires dependencies as well, and so the following modules were loaded in our cluster: BLAST v2.11.0+ and Diamond v2.0.9.

### Analysis of Autophagy related genes (Atg) and Antimicrobial peptides (Att and Dpt)

The correspondent gene name to all these genes in D. melanogaster was manually searched for in flybase.org, then grep among all orthogroups and copied into different folders to continue the analysis with the following [script](https://github.com/mmontonerin/Drosophila_wolbachia_infection_related_genes/blob/main/02_Ortholog_find_and_Phylogenetics/copy_orthogroups_to_folder.sh).
