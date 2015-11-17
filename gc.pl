#!/usr/bin/perl
use strictures;
use Bio::SeqIO;

# load file
my ($file) = @ARGV;

# read FASTA:
# first create SeqIO object
my $fasta = Bio::SeqIO->new(-file   => $file,
			    -format => 'fasta');

# state objects that keep the maximum gc and corresponding id
my $max_gc = 0;
my $max_id = "";

# then parse object
while (my $seq = $fasta->next_seq){

    # store FASTA id
    my $id = $seq->id;

    # calculate %GC
    my $g_count = uc($seq->seq) =~ tr/G/G/;
    my $c_count = uc($seq->seq) =~ tr/C/C/;
    my $seq_length = $seq->length;
    my $gc = ($g_count + $c_count) / $seq_length * 100;

    # overwrite $max_gc only if $gc > $max_gc
    if ($gc > $max_gc) {
	$max_gc = $gc;
	$max_id = $id;
    }
}

# print id and gc content of sequence with highest gc content
print $max_id, "\n";
print $max_gc, "\n";
