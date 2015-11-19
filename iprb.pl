#!/usr/bin/perl
use strictures;

# note, this is a brute force script
# it is possible to come up with a simpler formula

# open file
my ($file) = @ARGV;
open FILE, '<', $file;

# load parameters k, m and n
my ($k,$m,$n) = split ' ', <FILE>;

# compute population size p
my $p = $k + $m + $n;


##### The brute force code #####
# state all possible genotypes
my @genotypes = ('AA', 'aA', 'aa');

# store probabilities of presence of dominant allele
# per genotype combination
my %pr_dom = (
    'AAAA' => 1,
    'AAaA' => 1,
    'AAaa' => 1,
    'aAAA' => 1,
    'aAaA' => 0.75,
    'aAaa' => 0.5,
    'aaAA' => 1,
    'aaaA' => 0.5,
    'aaaa' => 0
    );

# set sum of all probabilities of presence dominant allele
my $pr_sum = 0;

# loop over all genotype combinations
foreach my $gt1 (@genotypes) {

    # set number of individuals y with genotype 1
    my $y;
    $y  = $k if ($gt1 eq 'AA');
    $y  = $m if ($gt1 eq 'aA');
    $y  = $n if ($gt1 eq 'aa');

    foreach my $gt2 (@genotypes) {

	# set number of individuals x with genotype 2 
	my $x;
	$x  = $k if ($gt2 eq 'AA');
	$x  = $m if ($gt2 eq 'aA');
	$x  = $n if ($gt2 eq 'aa');

	# calculate probability pr of presence dominant allele
	# in offspring of this genotype1-genotype2 combination
	my $pr;

	# if genotype1 equals genotype2,
	# population with genotype2 decrease by 1
	if    ($gt1 eq $gt2) {
	    $pr = ( $y/$p ) * ( ($x-1)/($p-1) ) * $pr_dom{$gt1 . $gt2};
	}
	# if genotype1 is not equal to genotype 2
	# population with genotype 2 is not affected
	elsif ($gt1 ne $gt2) {
	    $pr = ( $y/$p ) * ( $x/($p-1) ) * $pr_dom{$gt1 . $gt2};
	}
	
	# add probability to sum of all probabilities
	$pr_sum += $pr;
    }
}

# report final sum of probabilities of presence dominante allele
print $pr_sum, "\n";


##### The elegant code (after solving the equation) #####
$pr_sum = 1 - ( .25*$m*($m-1) + $m*$n + $n*($n-1) ) / ($p*($p - 1));
print $pr_sum, "\n";
