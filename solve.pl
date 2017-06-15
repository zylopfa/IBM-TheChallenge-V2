#!/usr/bin/perl

my $file = $ARGV[0];

open my $fh,"<$file" or die "Error opening input file!\n";
my $string = join "",<$fh>;
close $fh;

$string =~ s/\s//g;

while ( $string =~ m/(\d{8})/g ) {
  print chr(oct("0b" . $1)) ;
}

print "\n";
