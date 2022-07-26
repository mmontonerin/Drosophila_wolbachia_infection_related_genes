#!/bin/bash
#Important, get ~/.gm_key license from genemark in home directory
#Configure Augustus folder

g="/path/annotation/assemblies/D_sp_polish_nextdenovo_masked.fasta"
p="/path/annotation/proteome/sophophora_proteins.fasta"
wdir="/path/annotation/braker_out/D_sp/"

braker.pl --species=D_sp --genome=$g --prot_seq=$p --softmasking --cores=8 --etpmode --workingdir=$wdir
