## Ortholog analysis

### Data preparation

##### Published proteomes
The proteome of D. melanogaster and D. willistoni was obtained from [Flybase.org](https://flybase.org/)

* D. melanogaster r6.46 FB2022 03    
* D. willistoni r1.3 FB2015 01

Both proteomes (and specially D. melanogaster) contain a big amount of alternative isoforms for each gene.

A [script](https://github.com/mmontonerin/Drosophila_wolbachia_infection_related_genes/blob/main/02_Ortholog_find_and_Phylogenetics/parsing_FB_translation_file.pl) produced by Guilherme Baião was used to only obtain the longest isoform for each gene from the translation fasta file of flybase.org, maintaining the gene number for further analysis that would require obtaining the information associated with each gene from flybase.org.

##### BRAKER output
Gene predictions in fasta format from the BRAKER pipeline were renamed with [rename_braker_output_fasta_headers.sh](https://github.com/mmontonerin/Drosophila_wolbachia_infection_related_genes/blob/main/02_Ortholog_find_and_Phylogenetics/rename_braker_output_fasta_headers.sh) so that headers would contain a shorter version of the species name and an underscore, so that it can be parsed and reduced later in the pipeline, where some programs require short fasta headers.   

### Ortholog finder

[OrthoFinder v2.5.2](https://github.com/davidemms/OrthoFinder) was used for orthology inference between datasets.

`orthofinder.py -f /path/annotation/orthologues_all`

Where the folder `orthologues_all` contain each proteome fasta file.

OrthoFinder requires dependencies as well, and so the following modules were loaded in our cluster: BLAST v2.11.0+ and Diamond v2.0.9.

### Analysis of Autophagy related genes (Atg) and Antimicrobial peptides (Att and Dpt)

The correspondent gene name to all these genes in D. melanogaster was manually searched for in flybase.org, then grep among all orthogroups and copied into different folders to continue the analysis with [copy_orthogroups_to_folder.sh](https://github.com/mmontonerin/Drosophila_wolbachia_infection_related_genes/blob/main/02_Ortholog_find_and_Phylogenetics/copy_orthogroups_to_folder.sh).

The obtained orthogroups also had some genes with alternative isoforms in the Drosophila species of the willistoni group, post-BRAKER pipeline. Only the longest isoform was kept by running [keep_long_isoforms.py](https://github.com/mmontonerin/Drosophila_wolbachia_infection_related_genes/blob/main/02_Ortholog_find_and_Phylogenetics/keep_long_isoforms.py)

```
for i in ./ATG/*fa
do
        j=$(basename $i .fa)
        python keep_long_isoforms.py -i $i -n 1 > ./ATG/"$j"_oneiso.fa
done

for i in ./ATT/*fa
do
        j=$(basename $i .fa)
        python keep_long_isoforms.py -i $i -n 1 > ./ATT/"$j"_oneiso.fa
done

for i in ./DPT/*fa
do
        j=$(basename $i .fa)
        python keep_long_isoforms.py -i $i -n 1 > ./DPT/"$j"_oneiso.fa
done
```

Stop codons (*) were removed to avoid problems with alignment Software later

```
for i in ./ATG/*iso.fa
do
        sed -i 's/\*//g' $i
done

for i in ./ATT/*iso.fa
do
      sed -i 's/\*//g' $i    
done

for i in ./DPT/*iso.fa
do
     sed -i 's/\*//g' $i
done
```

[MAFFT v7.407](https://mafft.cbrc.jp/alignment/software/) was used to align the orthologue sequences

```
for i in ./ATG/*iso.fasta
do
        j=$(basename $i .fasta)
        mafft $i > ./ATG/"$j"_mafft.fasta
done

for i in ./ATT/*iso.fasta
do
        j=$(basename $i .fasta)
        mafft $i > ./ATT/"$j"_mafft.fasta
done

for i in ./DPT/*iso.fasta
do
        j=$(basename $i .fasta)
        mafft $i > ./DPT/"$j"_mafft.fasta
done
```

The alignments were trimmed with [TrimAl v1.4.1](http://trimal.cgenomics.org/)
```
for i in ./ATG/*mafft.fasta
do
        j=$(basename $i .fasta)
        trimal -in "$i" -out ./ATG/"$j"_trim.fasta -gt 0.1

done

for i in ./DPT/*mafft.fasta
do
        j=$(basename $i .fasta)
        trimal -in "$i" -out ./DPT/"$j"_trim.fasta -gt 0.1

done

for i in ./ATT/*mafft.fasta
do
        j=$(basename $i .fasta)
        trimal -in "$i" -out ./ATT/"$j"_trim.fasta -gt 0.1

done
```

Then, the fasta files are renamed again, this time with the script [rename_pre_phy.pl](https://github.com/mmontonerin/Drosophila_wolbachia_infection_related_genes/blob/main/02_Ortholog_find_and_Phylogenetics/rename_pre_phy.pl) so that we keep a very short name for each header, so that it can be transformed properly to PHYLIP format.

```
#Usage rename_pre_phy.pl:
#./rename_pre_phy.pl <fasta> <new_fasta> <common_log_file>
#Start by removing possible existent log file

rm Sequences_after_rename.log

echo -e "ATG\n" >> Sequences_after_rename.log
for i in ./ATG/*iso.fa
do
        j=$(basename $i .fa)
        ./rename_pre_phy.pl $i ./ATG/"$j".fasta Sequences_after_rename.log
done

echo -e "\n\nATT\n" >> Sequences_after_rename.log
for i in ./ATT/*iso.fa
do
        j=$(basename $i .fa)
        ./rename_pre_phy.pl $i ./ATT/"$j".fasta Sequences_after_rename.log
done

echo -e "\n\nDPT\n" >> Sequences_after_rename.log
for i in ./DPT/*iso.fa
do
        j=$(basename $i .fa)
        ./rename_pre_phy.pl $i ./DPT/"$j".fasta Sequences_after_rename.log
done
```

Files were transformed from FASTA to PHYLIP format with the script [fasta_to_phy.py](https://github.com/mmontonerin/Drosophila_wolbachia_infection_related_genes/blob/main/02_Ortholog_find_and_Phylogenetics/fasta_to_phy.py)

```
for i in ./ATG/*trim.fasta
do
        j=$(basename $i .fasta)
        python fasta_to_phy.py -i $i -o ./ATG/"$j".phy
done

for i in ./ATT/*trim.fasta
do
        j=$(basename $i .fasta)
        python fasta_to_phy.py -i $i -o ./ATT/"$j".phy
done

for i in ./DPT/*trim.fasta
do
        j=$(basename $i .fasta)
        python fasta_to_phy.py -i $i -o ./DPT/"$j".phy
done
```

## Phylogenetics

[IQTREE2 v2.20](http://www.iqtree.org/) was used to produce phylogenies for each of the aligned orthologous Atg, Att, and Dpt genes between species.

*Dependencies loaded in our cluster: gcc/9.3.0 openmpi/3.1.5*

```
for i in ./ATG/*phy
do
        j=$(basename $i .phy)
        iqtree2 -s $i --prefix ./ATG/"$j" --seed 120 -m MFP -b 100
done

for i in ./ATT/*phy
do
        j=$(basename $i .phy)
        iqtree2 -s $i --prefix ./ATT/"$j" --seed 120 -m MFP -b 100
done

for i in ./DPT/*phy
do
        j=$(basename $i .phy)
        iqtree2 -s $i --prefix ./DPT/"$j" --seed 120 -m MFP -b 100
done
```

## Phylogenomics
All the single copy genes that OrthoFinder found were aligned and modified in the same ways as the genes explained above, separately.

Then, the tool gene_stitcher.py in [https://github.com/ballesterus/Utensils](https://github.com/ballesterus/Utensils) was used to concatenate those alignments and create a partition file.

*Important, Python 2.7 needed*

The resulting partition file to the matrix looks like this:
```
 = 1-541;
 = 542-703;
```
I transform it with [prepare_partition_file_for_iqtree.pl](https://github.com/mmontonerin/Drosophila_wolbachia_infection_related_genes/blob/main/02_Ortholog_find_and_Phylogenetics/prepare_partition_file_for_IQtree.pl) to this:
```
AA, part1 = 1-541
AA, part2 = 542-703
```

Run IQTREE2:
```
iqtree2 -s SuperMatrix.phy -p Partition_SCG.txt -m MFP -b 100 -nt 20
```
