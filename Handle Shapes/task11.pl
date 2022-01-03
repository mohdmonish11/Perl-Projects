#!/usr/bin/perl use 5.010;
use strict;
use warnings;
use lib"C:/Users/monish.m/Desktop/Task/Perl/task11";  
use HandleShapes;

my $object = HandleShapes->new({
                            length => undef,
                            breadth => undef,
                            side => undef,
                            radius => undef,
                            base => undef,
                            height => undef,
                              });

while(1){
  print "Enter 1 to GET AREA OF RECTANGLE\n";
  print "Enter 2 to GET AREA OF SQUARE\n";
  print "Enter 3 to GET AREA OF CIRCLE\n";
  print "Enter 4 to GET AREA OF TRIANGLE\n";
  print "Enter 0 to exit\nChoose Wisely: ";
  my $input = <STDIN>;
  
  if ($input == 1){
    print "Please Enter the length of Rectangle: ";
    chomp(my $length = <STDIN>);
    print "Please Enter the breadth of Rectangle: ";
    chomp(my $breadth = <STDIN>);
    $object->{length} = $length;
    $object-> {breadth} = $breadth;
    $object->areaOfRectangle();
  }elsif($input == 2){
      print "Enter the side length of Square: ";
      chomp(my $side = <STDIN>);
      $object->{side} = $side;
      $object->areaOfSquare();
  } elsif ($input == 3){
      print "Enter the radius of circle: ";
      chomp(my $radius = <STDIN>);
      $object->{radius} = $radius;
      $object->areaOfCircle($radius);
  } elsif ($input == 4){
      print "Enter the  base length of Triangle: ";
      chomp(my $base = <STDIN>);
      print "Enter the height of Triangle: ";
      chomp(my $height = <STDIN>);
      $object->{base} = $base;
      $object->{height} = $height;
      $object->areaOfTriangle($base, $height);
  }
  last if($input == 0);

}