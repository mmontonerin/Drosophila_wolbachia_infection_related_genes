#!/usr/bin/perl
#
#use warnings;
#use strict;
##usage: ./rename_pre_phy.pl <fasta file> <new_fasta> <log_file>
#
#Rename fasta headers so that:
#
#Dpau_A28_jg11812.t1 transforms into DpauA28_1
#Dpau_MS_jg7580.t1 transforms into DpauMS_1
#Dpau_O11_jg14189.t1 transforms into DpauO11_1
#Dmel_FBgn0034110 transforms into Dmel_1
#Dwil_FBgn0222896 transforms into Dwil_1
#
#If they have more than one protein in the orthogroup, the second one will receive a "_2", then a "_3", and so on.
#
#Will create a log file with the original name together with the new name, so that it is easy to keep track of it.
#

open(FASTA, "<$ARGV[0]") || die("Usage: ./rename_pre_phy.pl <fasta file> <new_fasta> <log_file>\n$!,aborted");

open(OUTPUT, ">$ARGV[1]") || die("Usage: ./rename_pre_phy.pl <fasta file> <new_fasta> <log_file>\n$!,aborted");

open(LOG, ">>$ARGV[2]");

my $i = 0;
my $j = 0;
my $k = 0;
my $l = 0;
my $m = 0;
my $n = 0;
my $o = 0;
my $p = 0;
my $q = 0;
my $r = 0;
my $p = 0;
my $q = 0;
my $r = 0;
my $s = 0;
my $t = 0;
my $v = 0;

print LOG "$ARGV[1]\n";

while (my $line = <FASTA>) 
{
	chomp $line;
	{
		if ($line =~ /^>(PauA28)_.+/)
		{
			$i++;
			print OUTPUT ">$1_$i\n";
			print LOG "$line\t$1_$i\n";
		}
                elsif ($line =~ /^>(PauMS)_.+/)
                {
                        $j++;
                        print OUTPUT ">$1_$j\n";
                        print LOG "$line\t$1_$j\n";
                }
                elsif ($line =~ /^>(PauO11)_.+/)
                {
                        $k++;
                        print OUTPUT ">$1_$k\n";
                        print LOG "$line\t$1_$k\n";
                }
		elsif ($line =~ /^>(PauL06)_.+/)
                {
                        $n++;
                        print OUTPUT ">$1_$n\n";
                        print LOG "$line\t$1_$n\n";
                }
                elsif ($line =~ /^>(PauL12)_.+/)
                {
                        $o++;
                        print OUTPUT ">$1_$o\n";
                        print LOG "$line\t$1_$o\n";
                }
                elsif ($line =~ /^>(Dsuc)_.+/)
                {
                        $p++;
                        print OUTPUT ">$1_$p\n";
                        print LOG "$line\t$1_$p\n";
                }
                elsif ($line =~ /^>(Dins)_.+/)
                {
                        $q++;
                        print OUTPUT ">$1_$q\n";
                        print LOG "$line\t$1_$q\n";
                }
                elsif ($line =~ /^>(Dsp)_.+/)
                {
                        $r++;
                        print OUTPUT ">$1_$r\n";
                        print LOG "$line\t$1_$r\n";
                }
                elsif ($line =~ /^>(Dwil00)_.+/)
                {
                        $s++;
                        print OUTPUT ">$1_$s\n";
                        print LOG "$line\t$1_$s\n";
                }
                elsif ($line =~ /^>(DwilLG3)_.+/)
                {
                        $t++;
                        print OUTPUT ">$1_$t\n";
                        print LOG "$line\t$1_$t\n";
                }
                elsif ($line =~ /^>(Dtro)_.+/)
                {
                        $v++;
                        print OUTPUT ">$1_$v\n";
                        print LOG "$line\t$1_$v\n";
                }
		elsif ($line =~ /^>(Dmel)_.+/)
		{
			$l++;
                        print OUTPUT ">$1_$l\n";
			print LOG "$line\t$1_$l\n";
		}
		elsif ($line =~ /^>(Dwil)_.+/)
                {
                        $m++;
                        print OUTPUT ">$1_$m\n";
                        print LOG "$line\t$1_$m\n";
                }
		else 
		{
		print OUTPUT "$line\n";
		} 
	}
}
exit;			




