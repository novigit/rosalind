#!/usr/bin/perl
use strictures;

# open file
my ($file) = @ARGV;
open FILE, '<', $file;

# get n, number of months, and k, number of offspring from file
my ($n, $k) = split ' ', <FILE>;
close FILE;

# create array to hold all total rabbit pairs per month
my @f = (1,1); # f(1) and f(2) always have 1 rabbit pair

# loop over the months
for (my $i = 2; $i < $n; $i++) {

    # calculate total rabbit pairs in month i
    my $adults = $f[$i-1];
    my $kids   = $f[$i-2] * $k;
    my $total  = $adults  + $kids;

    # add to @f
    $f[$i] = $total;
}

# print total rabbit pairs in month $n
print $f[$n-1], "\n";


