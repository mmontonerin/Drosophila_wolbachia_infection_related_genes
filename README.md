# Genomics of Drosophila species in the group Willistoni
## Pipeline from genome assembly to gene analysis
### Analysis of some of the genes involved in the interaction of Wolbachia and Drosophila, both in restricted and systemic infections

## Data
* Klasson's Lab
	* Nanopore sequencing
		* D. paulistorum O11
		* D. paulistorum MS
		* D. paulistorum A28

	* Illumina sequencing
		* D. paulistorum O11
		* D. paulistorum MS
		* D. paulistorum A28
		* D. tropicalis

	* RNA Illumina sequencing
		* D. paulistorum O11
		* D. paulistorum A28

* [Kim *et al.* 2021](https://elifesciences.org/articles/66405):
	* Nanopore sequencing
		* D. paulistorum L12
		* D. paulistorum L06
		* D. willistoni LG3
		* D. willistoni 00
		* D. tropicalis
		* D. insularis
		* D. sp
		* D. sucinea
	* Illumina sequencing
		* D. paulistorum L06
		* D. willistoni LG3
		* D. willistoni 00
		* D. insularis
		* D. sp
		* D. sucinea

* [Flybase.org](https://flybase.org/)
	* Proteome
		* D. melanogaster r6.46 FB2022 03
		* D. willistoni r1.3 FB2015 01


## Genome Assembly

Pipeline description and scripts [here](https://github.com/mmontonerin/Drosophila_wolbachia_infection_related_genes/tree/main/00_Assembly)

* Read preparation
* Whole genome assembly
* Assembly polishing
* Assembly quality evaluation

## Gene predictions

Pipeline description and scripts [here](https://github.com/mmontonerin/Drosophila_wolbachia_infection_related_genes/tree/main/01_Gene_prediction)

* Repeat elements modeler and genome assembly masking
* Gene prediction
	* with only Sophophora proteome as evidence

	OR
	* with Sophophora proteome and RNA seq mapped sequences

## Ortholog find and Phylogenetics

Pipeline description and scripts [here](https://github.com/mmontonerin/Drosophila_wolbachia_infection_related_genes/tree/main/02_Ortholog_find_and_Phylogenetics)

* Ortholog finder
* Select genes to study (or all single copy orthologs)
* Keep only longer isoforms
* Gene alignment
* Alignment trimming
* Phylogenetic inference
* Phylogenomic inference

## Software used

|Software used|version|
|:---         |:---:  |
|Genome assembly pipeline|
|[Filt-long](https://github.com/rrwick/Filtlong)|0.2.1|
|[NextDenovo](https://github.com/Nextomics/NextDenovo/releases/tag/v2.5.0)|2.5.0|
|[Minimap](https://github.com/lh3/minimap2)|2.24|
|[samtools](https://github.com/samtools/samtools)|1.14|
|[P.E.P.P.E.R-Marign-DeepVariant](https://github.com/kishwarshafin/pepper/releases/tag/r0.4)|0.4|
|[bcftools](https://github.com/samtools/bcftools)|1.15.1|
|[BWA](https://github.com/lh3/bwa)|0.7.17|
|[Pilon](https://github.com/broadinstitute/pilon)|1.24|
|Gene prediction pipeline|
|RepeatModeler](https://www.repeatmasker.org/RepeatModeler/)|1.0.8|
|[BLAST](https://blast.ncbi.nlm.nih.gov/Blast.cgi)|2.11.0+|
|[RepeatMasker](http://www.repeatmasker.org/RepeatMasker/)|4.0.7|
|[STAR](https://github.com/alexdobin/STAR/releases/tag/2.7.9a)|2.7.9a|
|[Braker](https://github.com/Gaius-Augustus/BRAKER)|2.1.6|
|Ortholog find and phylogenies|
|[OrthoFinder](https://github.com/davidemms/OrthoFinder)|2.5.2|
|[MAFFT](https://mafft.cbrc.jp/alignment/software/)|7.407|
|[TrimAl](http://trimal.cgenomics.org/)|1.4.1|
|[IQTREE2](http://www.iqtree.org/)|2.20|
