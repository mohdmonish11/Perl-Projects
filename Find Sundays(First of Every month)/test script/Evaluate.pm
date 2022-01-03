#!/usr/bin/perl use 5.010;

package Evaluate;
use strict;
use warnings;
use Data::Dumper;


sub findLeapYears{
    my $start_years = $_[0];
    my $end_years = $_[1];
    my %leap_years;
    my $calculate_sundays=0;
    for my $year($start_years..$end_years){
        if ((($year % 4 == 0) && ($year % 100 != 0)) || ($year % 400 == 0)){
            $leap_years{$year} = 'leap';
        }   
    }
    return (\%leap_years);
}


sub findingSunday{
    my $start_years = $_[0];
    my $end_years = $_[1];
    my $leap_years = $_[2];
    my $calculate_sundays;
    my %week =( 1 => 'Sunday', 2 => 'Monday', 3 => 'Tuesday', 4=> 'Wednesday', 5=> 'Thursday', 6=> 'Friday', 7=> 'Saturday');
    my %months = (1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30, 7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31);
    my $sumCal = "none";
    for my $year($start_years..$end_years){
        if(exists($leap_years ->{$year})){
            $months{2} = 29; 
        }
        else{
            $months{2} = 28; 
        }
        for my $value(1..12){
            if ($sumCal eq 'none'){
                $sumCal=3;      #on January 1901 Tuesday is there so start of week is from i.e 3 is added ontime.    
            } 
            $sumCal= $sumCal  + (($months{$value}) % 7);
            if ($sumCal > 7){
                $sumCal-=7;
            }
            my $sundays = $week{$sumCal};
            if ($sundays eq 'Sunday'){
                $calculate_sundays+=1;
            }
        }
    }
    return $calculate_sundays;
    # return print "The Total Sundays between years are: ",$calculate_sundays,"\n";
}

1;