#!/usr/bin/perl
use strictures;

# take file from command line
my ($file) = @ARGV;

# open file
open FILE, '<', $file;

# data structures
my ($dna, $c_dna, $rc_dna);

# read dna sequence in file
while (my $line = <FILE>){
    chomp $line; # remove newline character from $line
    $dna .= uc($line); # $dna should be all uppercase characters
}
close FILE;

# reverse complement dna
# first complement
($c_dna = $dna) =~ tr/ATGC/TACG/;
# then reverse
$rc_dna = reverse($c_dna);

print STDOUT $rc_dna, "\n";
