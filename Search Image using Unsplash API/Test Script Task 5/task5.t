#!/usr/bin/perl use 5.010;
use strict;
use warnings;
use Test::More;
use Data::Dumper;
use Test::Deep;
use lib"C:/Users/MOHD MONISH/Desktop/Task/PERL/Task5/Final CGI View";

BEGIN {
    use_ok("Unsplash") or die "Unable to open $! ($@)"
};


subtest "UNSPLASH API CHECK/ unsplashApi" => sub{
    my $keyword = "flower";
    my $obj = new Unsplash();
    my $value = $obj->unsplashApi($keyword);
    my $expected_output = 1 if ($value);
    ok(1 == $expected_output, "TEST IS OKAY") or diag explain $value;
};

subtest "INVALID INPUT CHECK/ unsplashApi" => sub{
    my $keyword = "nscknsac";
    my $obj = new Unsplash();
    my $value = $obj->unsplashApi($keyword);
    my $expected_output = "Invalid Input\n";
    ok($value eq $expected_output, "TEST IS OKAY") or diag explain $value;
};

done_testing();