#!/usr/bin/perl use 5.010;
use Moose;
use Data::Dumper;
use lib"C:/Users/monish.m/Desktop/Task/Perl/Task10";
use Evaluate;
use JSON qw//;

my $start_years= 1901;
my $end_years = 2000;


my $leap_year = Evaluate::findLeapYears($start_years,$end_years); # passing Values to the modules
# print Dumper $leap_year;

Evaluate::findingSunday($start_years,$end_years,$leap_year);

1;