#!/usr/bin/perl use 5.010;
package Square;
use strict;
use warnings;
use PrintStatement;

our @ISA = qw(PrintStatement);


sub new{
    my ($class,$args) =@_;
    my $self={
        side => $args->{side},
        };
    return bless $self, $class;
}

sub areaOfSquare{
    my $object = shift;
    $object->{area} = $object->{side}**2;
}

1;