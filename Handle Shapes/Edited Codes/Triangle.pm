#!/usr/bin/perl use 5.010;
package Triangle;
use strict;
use warnings;
use PrintStatement;

our @ISA = qw(PrintStatement);

sub new{
    my ($class,$args) =@_;
    my $self={
        base => $args->{base} ,
        height => $args->{height} || 1,   #we can use or operator
        };
    return bless $self, $class;
}

sub areaOfTriangle{
    my $object = shift;
    $object->{area} = 0.5*$object->{base}*$object->{height};
}

1;