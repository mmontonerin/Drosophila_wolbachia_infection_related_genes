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



|Software used|version|
|:---         |:---:  |
|[Filt-long](https://github.com/rrwick/Filtlong)|0.2.1|
|[NextDenovo](https://github.com/Nextomics/NextDenovo/releases/tag/v2.5.0)|2.5.0|
|[Minimap](https://github.com/lh3/minimap2)|2.24|
|[samtools](https://github.com/samtools/samtools)|1.14|
|[P.E.P.P.E.R-Marign-DeepVariant](https://github.com/kishwarshafin/pepper/releases/tag/r0.4)|0.4|
|[bcftools](https://github.com/samtools/bcftools)|1.15.1|
|[BWA](https://github.com/lh3/bwa)|0.7.17|
|[Pilon](https://github.com/broadinstitute/pilon)|1.24|

