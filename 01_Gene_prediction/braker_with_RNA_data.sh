#!/bin/bash
#Important, get ~/.gm_key license from genemark in home directory
#Configure Augustus folder

g="/path/annotation/assemblies/O11_polish_nextdenovo_masked.fasta"
p="/path/annotation/proteome/sophophora_proteins.fasta"
rna="/path/annotation/RNA_map/O11Aligned.sortedByCoord.out.bam"
wdir="/path/annotation/braker_out/O11/"

braker.pl --species=D_paulistorum_O11 --genome=$g --prot_seq=$p --bam=$rna --softmasking --cores=8 --etpmode --workingdir=$wdir
