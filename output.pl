#!/usr/bin/perl

my $limit = 20;

calculate($limit);

sub calculate {
  my $l = shift;
  my @arr = ();
  for (my $p=0; $p<$l; $p++) {
     $arr[$p] = "true";
  }

  for ( my $i=2; $i*$i <= $l; $i++ ) {
    if ($arr[$i] eq "true") {
      for ( my $m = $i*$i; $m<=$l;$m+=$i) {
        $arr[$m] = "false";
      }
    }
  }

  for ( my $i=2;$i<=$l;$i++) {  
    if ( $arr[$i] eq "true" ) {
      print $i;
    }
  }
}

