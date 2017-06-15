# The Challenge Vol2

We are given a link
`https://cic-denmark.eu-gb.mybluemix.net/pages/TheChallenge`

We fire up our favorite browser and see a page with "The Challenge?"
written in bold in the middle of the page. We also see what appears 
to be an image, which has not been loaded properly.

We right click the image to copy its url, which we then enter into
the address field in our browser.

We get a PDF file which resembles a question mark drawn in binary
ASCII art. We copy the content into a text file and create the
following perl script to decipher it. (our first hunch is that the
binary digits make up some kind of ascii message).

```
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
```

We call the program with the name of the file where we copied the
text content of the pdf.

`./solve.pl question_mark.txt`

And we get the result (the result have been censored, its up to the reader to
 make his own program or solve it by hand).

`http://ibm.biz/Bdi????`

This page leads us to something that looks like Java code, not fond of java and
do not have it installed, but I hand translate it to perl and get the following 
program

```
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
```

The result of this is a large integer which you enter into the form field
and press "Execute". Again its up to the person reading this to make his own
program, run the java program or by some other mean, solve the challenge.

By solving this you get a final url which you can visit, to be congratulated
on your efforts.

All in all a nice challenge.

