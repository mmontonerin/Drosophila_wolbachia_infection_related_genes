#!/usr/bin/perl

# 

if (! @ARGV) {
  print "\nGets longest isoform per gene\n\n";
  print "\nUsage: perl script.pl FlyBase_translations_fasta_file\n\n";
  exit 0;
}

open FB, $ARGV[0];  
  while (<FB>) {
    chomp;
    if (/^>/) {
      $line = $_;
      $getseq = "no";

      @split = split " ", $line;
      $FBpp = $split[0];
        $FBpp =~ s/>//;

      $FBgn = $split[5];
        $FBgn =~ s/parent=(FBgn\d+).*/$1/;

      $FBtr = $split[5];
        $FBtr =~ s/parent=FBgn\d+\,(FBtr\d+).*/$1/;

      $length = $split[8];
        $length =~ s/length=(\d+);/$1/;

      $name = $split[4];
        $name =~ s/name=//; 
        $name =~ s/\;//;

      if (! $hash{$FBgn}) {
        $hash{$FBgn}{'FBpp'} = $FBpp;
        $hash{$FBgn}{'FBtr'} = $FBtr;
        $hash{$FBgn}{'length'} = $length;
        $hash{$FBgn}{'name'} = $name;
        $getseq = "yes";
      }

      elsif ($hash{$FBgn} && $hash{$FBgn}{'length'} >= $length){
      }

      elsif ($hash{$FBgn} && $hash{$FBgn}{'length'} < $length){
        $hash{$FBgn}{'FBpp'} = $FBpp;
        $hash{$FBgn}{'FBtr'} = $FBtr;
        $hash{$FBgn}{'length'} = $length;
        $hash{$FBgn}{'name'} = $name;
        $getseq = "yes";
      }
    }

    elsif (/^\w/ && $getseq eq "yes") {
      $hash{$FBgn}{'seq'} .= $_;
    }
  }
close FB;

foreach $key (sort {$hash{$a} <=> $hash{$b}} keys %hash) {
  print ">$key $hash{$key}{'FBpp'} $hash{$key}{'FBtr'} $hash{$key}{'length'} $hash{$key}{'name'}\n$hash{$key}{'seq'}\n";
}
