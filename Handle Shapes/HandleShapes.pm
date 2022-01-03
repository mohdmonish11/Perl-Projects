#!/usr/bin/perl use 5.010;
package HandleShapes;
use strict;
use warnings;
use Math::Trig;
use PrintStatement;

our @ISA = qw(PrintStatement);

sub new{
    my ($class,$args) =@_;
    my $self={
      length => $args->{length},
      breadth => $args->{breadth},
      side => $args->{side},
      radius => $args->{radius},
      base => $args->{base} ,
      height => $args->{height} || 1,   #we can use or operator 
    };
    return bless $self, $class;
}

sub areaOfRectangle{
  my $object = shift;
  return (PrintStatement::printValues($object->{length}*$object->{breadth}));
}

sub areaOfSquare{ 
  my $object = shift;
  return (PrintStatement::printValues($object->{side}**2));
}

sub areaOfCircle{
  my $object = shift;
  return (PrintStatement::printValues(pi()*($object->{radius}**2)));
}

sub areaOfTriangle{
  my $object = shift;
  my ($base, $height) = @_;
  return (PrintStatement::printValues(0.5*$object->{base}*$object->{height}));
}

1;