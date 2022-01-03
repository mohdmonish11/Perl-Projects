#!/usr/bin/perl use 5.010;
use Moose;
use Data::Dumper;
use lib"C:/Users/MOHD MONISH/Desktop/Task/PERL/Task10";
use Evaluate;

my $start_years= 1901;
my $end_years = 2000;


my $leap_year = Evaluate::findLeapYears($start_years,$end_years); # passing Values to the modules

Evaluate::findingSunday($start_years,$end_years,$leap_year);
