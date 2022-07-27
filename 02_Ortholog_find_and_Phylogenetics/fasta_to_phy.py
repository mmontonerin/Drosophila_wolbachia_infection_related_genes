#!/usr/bin/env python

from __future__ import print_function
from Bio import SeqIO
from argparse import ArgumentParser

#Mercè Montoliu-Nerin, July 2022

#Arguments, input (fasta file, already aligned), output (phylip file)
parser = ArgumentParser(description="Converts a relaxed fasta alignment to a phylip format")
parser.add_argument("-i", "--input", help="input fasta", required=True)
parser.add_argument("-o", "--output", help="output phy", required=True)
args = parser.parse_args()

#Using SeqIO to parse and write into the different formats
FASTA = SeqIO.parse(args.input, "fasta")

PHY = SeqIO.write(FASTA, args.output, "phylip")
