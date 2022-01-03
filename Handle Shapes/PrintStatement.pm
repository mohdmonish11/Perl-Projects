#!/usr/bin/perl use 5.010;
package PrintStatement;
use strict;
use warnings;


sub printValues{
  my $value = $_[0];
  return print "The area is ", $value,"\n";
}
1;

