#!/usr/bin/perl use 5.010;
package Circle;
use strict;
use warnings;
use Math::Trig;
use PrintStatement;

our @ISA = qw(PrintStatement);


sub new{
    my ($class,$args) =@_;
    my $self={
        radius => $args->{radius},
        };
    return bless $self, $class;
}

sub areaOfCircle{
    my $object = shift;
    $object->{area} = pi()*($object->{radius}**2);
}

1;