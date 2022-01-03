#!/usr/bin/perl use 5.010;
package PrintStatement;
use strict;
use warnings;


sub printValues{
    my $print_obj = shift;
    return print "The area is ", $print_obj->{area},"\n";
}
1;

