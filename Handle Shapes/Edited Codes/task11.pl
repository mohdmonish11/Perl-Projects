#!/usr/bin/perl use 5.010;
use strict;
use warnings;
use lib"C:/Users/monish.m/Desktop/Task/Perl/task11/submitted";  
use Rectangle;
use Triangle;
use Square;
use Circle;


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
        my $rect_obj = Rectangle->new({
                        length => $length,
                        breadth =>$breadth
                        });
        $rect_obj->areaOfRectangle();
        $rect_obj->printValues();
    } elsif($input == 2){
        print "Enter the side length of Square: ";
        chomp(my $side = <STDIN>);
        my $square_obj = Square->new({
                        side => $side,
                        });
        $square_obj->areaOfSquare();
        $square_obj->printValues();
    } elsif ($input == 3){
        print "Enter the radius of circle: ";
        chomp(my $radius = <STDIN>);
        my $circle_obj = Circle->new({
                        radius => $radius,
                        });
        $circle_obj->areaOfCircle();
        $circle_obj->printValues();
    } elsif ($input == 4){
        print "Enter the  base length of Triangle: ";
        chomp(my $base = <STDIN>);
        print "Enter the height of Triangle: ";
        chomp(my $height = <STDIN>);
        my $triangle_obj = Triangle->new({
                        base => $base,
                        height => $height,
                        });
        $triangle_obj->areaOfTriangle();
        $triangle_obj->printValues();
    }
    last if($input == 0);

}