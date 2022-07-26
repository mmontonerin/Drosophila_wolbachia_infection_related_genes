#!/usr/bin/env python
#Merce Montoliu-Nerin, June 2022
from __future__ import print_function
from Bio import SeqIO
from argparse import ArgumentParser

#Usage:
#python keep_long_isoforms.py -i <fasta_file> -n <#of isoforms to keep> > output_file.fasta
#For only the longest isoform, n = 1

def main():
        args = get_args()
        prot_sel = None
        proteins = []

        for sequence in SeqIO.parse(args.input, "fasta"):
                prot = sequence.id.split(".")[0]

                if prot_sel is None:
                        prot_sel = prot

                if prot_sel == prot:
                        proteins.append(sequence)

                else:
                        print_longest_proteins(proteins, args.number)
                        prot_sel = prot
                        proteins = [sequence]

        print_longest_proteins(proteins, args.number)

def print_longest_proteins(proteins, number):
        longest = sorted(proteins, key=lambda x: len(x.seq), reverse=True)

        for record in longest[:number]:
                print(">"+record.id, record.seq, sep= "\n")

def get_args():
    parser = ArgumentParser(description="")
    parser.add_argument("-i", "--input", help="input fasta", required=True)
    parser.add_argument("-n", "--number", help="number of longest isoforms per protein", type=int, required=True)
    return parser.parse_args()


if __name__ == '__main__':
    main()
