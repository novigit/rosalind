#!/opt/local/bin/perl
use strictures;

my ($file) = @ARGV;
my ($a_count, $t_count, $c_count, $g_count) = 0;

open FILE, '<', $file;
while (<FILE>) {
    chomp;
    my $dna = uc($_);
#   print $dna;
    $a_count = $dna =~ tr/A/A/;	
    $c_count = $dna =~ tr/C/C/;	
    $g_count = $dna =~ tr/G/G/;	
    $t_count = $dna =~ tr/T/T/;	

}
close FILE;

print "A Count: ", $a_count, "\n";
print "C Count: ", $c_count, "\n";
print "G Count: ", $g_count, "\n";
print "T Count: ", $t_count, "\n";

