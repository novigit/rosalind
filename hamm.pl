#!/usr/bin/perl
use strictures;

# open file
my ($file) = @ARGV;
open FILE, '<', $file;

# get the 's' sequence and 't' sequence
my $s = <FILE>; # first  line of FILE
my $t = <FILE>; # second line of FILE
chomp ($s, $t); # remove \n from $s and $t

close FILE;

# compute hamming distance
# = number of differences between the two strings
my $hamm = 0;

# loop over each position in sequence
for (my $i = 0; $i < length($s); $i++) {

    # identify letter at position i in s ánd t
    my $s_i = substr($s,$i,1);
    my $t_i = substr($t,$i,1);

    # increase hamming distance with 1 if
    # s and t differ at position i
    $hamm++ if ($s_i ne $t_i);
}

# print final hamming distance to STDOUT
print STDOUT $hamm, "\n";
