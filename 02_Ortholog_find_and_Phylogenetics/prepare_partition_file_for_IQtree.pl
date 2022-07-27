#!/usr/bin/perl
##
use warnings;
use strict;
#Mercè Montoliu-Nerin, July 2022
###usage: prepare_partition_file_for_iqtree.pl <partition_file> <new_partition_file>
#
#Changes a partition file from this (after running gene_stitcher.py in https://github.com/ballesterus/Utensils):
# = 1-541;
# = 542-703;
#To this:
#AA, part1 = 1-541;
#AA, part2 = 542-703;

open(PART, "<$ARGV[0]") || die("Usage: prepare_partition_file_for_iqtree.pl <partition_file> <new_partition_file>\n$!,aborted");

open(OUTPUT, ">$ARGV[1]") || die("Usage: prepare_partition_file_for_iqtree.pl <partition_file> <new_partition_file> \n$!,aborted");

my $i = 0;

while (my $line = <PART>)
{
        chomp $line;
        {
                if ($line =~ /(=.+);/)
                {
                        $i++;
                        print OUTPUT "AA, part$i $1\n";
                }
                else
                {
                next;
                }
        }
}
exit;
