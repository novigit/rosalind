#!/usr/bin/perl
use strictures;

# take file from command line
my ($file) = @ARGV;

# open file
open FILE, '<', $file;

# state data holders
my ($dna, $rna);

# read file line by line
while (my $line = <FILE>) {

    # concatenate each line to $dna
    # also accomodate lowercase characters
    chomp $line;
    $dna .= uc($line);
}

# transcribe $dna to $rna
# copy $dna into $rna, and then substitute $rna
($rna = $dna) =~ s/T/U/g;

# print $rna to STDOUT
print STDOUT $rna, "\n";
