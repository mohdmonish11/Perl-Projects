#!/usr/bin/perl use 5.010;
use strict;
use warnings;
# use lib"C:/Users/monish.m/Desktop/Task/Perl/task12";  
use CreateCovidApi;
use Data::Dumper;
use CGI;
use JSON;

my $cgi = new CGI;

if ($ENV{'REQUEST_METHOD'} eq "GET") {
    my $action = $cgi->param("action");
    my $country = $cgi->param("country");
    my $fromDate = $cgi->param("fromDate");
    my $toDate = $cgi->param("toDate");

    if( $action ne '' && $country ne '' && $fromDate ne ''){
        my $covid = new CreateCovidApi($country, $fromDate, $toDate);   #creating an object

        if ($action eq "Particular date") {
            my %covid_data = $covid->specificDateFetch();
            if($covid_data{status} == 1) {
                my $result = eval{to_json(\%covid_data)};
                if ($@) {
                    my $error_data = '{"status: 0, "error":"Invalid input"}';
                    return $error_data;
                } else {
                    print $cgi->header(
                        -type => 'application/json',
                    );
                    print $result;
                }
            }
        } elsif ($action eq "Date range") {
            if( $toDate ne '' ) {
                my $covid_data = $covid->dateRangeFetch();
                if($covid_data{status} == 1) {
                    my $result = eval{to_json(\%covid_data)};
                    if ($@) {
                        my $error_data = '{"status: 0, "error":"Invalid input"}';
                        return $error_data;
                    } else {
                        print $cgi->header(
                            -type => 'application/json',
                        );
                        print $result;
                    }
                }
            }
        }
    }
}