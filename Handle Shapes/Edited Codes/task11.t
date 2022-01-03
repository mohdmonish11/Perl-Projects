#!/usr/bin/perl use 5.010;
use strict;
use warnings;
use Test::More;
# use Test::Deep;
use lib 'C:/Users/monish.m/Desktop/Task/Perl/task11/submitted';
# use Circle

BEGIN {
    use_ok("Circle") or die "Unable to open $! ($@)";
    use_ok("Rectangle") or die "Unable to open $! ($@)";
    use_ok("Square") or die "Unable to open $! ($@)";
    use_ok("Triangle") or die "Unable to open $! ($@)";
}

subtest "Circle" => sub{
    my $expected_ouput = 12.5663706143592;
    my $radius = 2;
    my $circle_obj = Circle->new({
                        radius => $radius,
                        });

    $circle_obj->areaOfCircle();
    my $test_ouput = $circle_obj->{area};
    is_deeply($test_ouput, $expected_ouput, "Correct Output");
};

subtest "Rectangle" => sub{
    my $expected_ouput = 10;
    my $length = 2;
    my $breadth = 5;
    my $rect_obj = Rectangle->new({
                        length => $length,
                        breadth =>$breadth
                        });
    $rect_obj->areaOfRectangle();
    my $test_ouput = $rect_obj->{area};
    is_deeply($test_ouput, $expected_ouput, "Correct Output");
};

subtest "Square" => sub{
    my $expected_ouput = 16;
    my $side = 4;
    my $square_obj = Square->new({
                        side => $side,
                        });
    $square_obj->areaOfSquare();
    my $test_ouput = $square_obj->{area};
    is_deeply($test_ouput, $expected_ouput, "Correct Output");
};

subtest "Triangle" => sub{
    my $expected_ouput = 16;
    my $base = 4;
    my $height = 8;
     my $triangle_obj = Triangle->new({
                        base => $base,
                        height => $height,
                        });
    $triangle_obj->areaOfTriangle();
    my $test_ouput = $triangle_obj->{area};
    is_deeply($test_ouput, $expected_ouput, "Correct Output");
};

done_testing();
1;