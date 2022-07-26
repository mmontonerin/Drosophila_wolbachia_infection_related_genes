#!/bin/bash

#sed commands to rename fasta headers in every proteome
#so that they contain the species name first
#and as an abreviation, as required for other programs further on in the pipeline.
sed 's/>/>PauMS_/g' MS_etpmode/augustus.hints.aa > ../orthologues_all/PauMS_prot.fasta
sed 's/>/>PauO11_/g' O11_etpmode_2/augustus.hints.aa > ../orthologues_all/PauO11_prot.fasta
sed 's/>/>PauA28_/g' A28_etpmode/augustus.hints.aa > ../orthologues_all/PauA28_prot.fasta
sed 's/>/>PauL06_/g' D_paulistorum_L06/augustus.hints.aa > ../orthologues_all/PauL06_prot.fasta
sed 's/>/>PauL12_/g' D_paulistorum_L12/augustus.hints.aa > ../orthologues_all/PauL12_prot.fasta
sed 's/>/>Dins_/g' D_insularis/augustus.hints.aa > ../orthologues_all/Dins_prot.fasta
sed 's/>/>Dsp_/g' D_sp/augustus.hints.aa > ../orthologues_all/Dsp_prot.fasta
sed 's/>/>Dsuc_/g' D_sucinea/augustus.hints.aa > ../orthologues_all/Dsuc_prot.fasta
sed 's/>/>Dtro_/g' D_tropicalis/augustus.hints.aa > ../orthologues_all/Dtro_prot.fasta
sed 's/>/>Dwil00_/g' D_willistoni_00/augustus.hints.aa > ../orthologues_all/Dwill00_prot.fasta
sed 's/>/>DwilLG3_/g' D_willistoni_LG3/augustus.hints.aa > ../orthologues_all/DwillLG3_prot.fasta
sed -i 's/>/>Dwil_/g' dwil_parsed_translation.fasta
sed -i 's/>/>Dmel_/g' dmel_parsed_translation.fasta
