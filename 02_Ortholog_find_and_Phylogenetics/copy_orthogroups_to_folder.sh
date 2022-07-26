#!/bin/bash -l

#grep orthogroups containing Atg genes
grep -l -E "FBgn0260945|\
FBgn0044452|\
FBgn0036813|\
FBgn0031298|\
FBgn0038325|\
FBgn0029943|\
FBgn0264325|\
FBgn0034366|\
FBgn0052672|\
FBgn0038539|\
FBgn0034110|\
FBgn0040780|\
FBgn0036255|\
FBgn0261108|\
FBgn0039636|\
FBgn0039705|\
FBgn0037363|\
FBgn0035850|\
FBgn0032935|\
FBgn0030960" ./Orthogroup_Sequences/*fa >> ATG_orthogroups.txt

#grep orthogroups containing Att genes
grep -l -E "FBgn0012042|\
FBgn0041581|\
FBgn0041579|\
FBgn0038530" ./Orthogroup_Sequences/*fa >> ATT_orthogroups.txt

#grep orthogroups containing Dpt genes
grep -l -E "FBgn0004240|\
FBgn0034407" ./Orthogroup_Sequences/*fa >> DPT_orthogroups.txt

#Create a folder for each gene classification and copy there the orthogroups that were grep above
mkdir ATG
sed -e 's/\.\//cp\ \.\//g;s/fa/fa\ \.\/ATG\//g' ATG_orthogroups.txt > ATG_copy_files.sh

mkdir ATT
sed -e 's/\.\//cp\ \.\//g;s/fa/fa\ \.\/ATT\//g' ATT_orthogroups.txt > ATT_copy_files.sh

mkdir DPT
sed -e 's/\.\//cp\ \.\//g;s/fa/fa\ \.\/DPT\//g' DPT_orthogroups.txt > DPT_copy_files.sh

chmod +x *copy_files.sh

./ATG_copy_files.sh
./ATT_copy_files.sh
./DPT_copy_files.sh
