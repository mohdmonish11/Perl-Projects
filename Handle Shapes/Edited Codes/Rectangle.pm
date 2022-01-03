#!/usr/bin/perl use 5.010;
package Rectangle;
use strict;
use warnings;
use PrintStatement;

our @ISA = qw(PrintStatement);


sub new{
    my ($class,$args) =@_;
    my $self={
        length => $args->{length},
        breadth => $args->{breadth},
        };
    return bless $self, $class;
}

sub areaOfRectangle{
    my $object = shift;
    $object->{area} = $object->{length} * $object->{breadth};
    #   return ($object->{length}*$object->{breadth});
}

1;