#!/usr/bin/perl use 5.010;
package CreateCovidApi;
use strict;
use warnings;
use LWP::UserAgent;
use HTTP::Request();
use JSON;
use Data::Dumper;
use constant URL => 'https://api.covid19api.com/';

sub new{
	my $class = shift;
	my $self = {
        country => shift;
        start_date => shift;
        end_date => shift;
    };
	return bless $self,$class;
}

sub creatingConnectionsWithAPI{
    my $url = $_[0];
    my $userAgent = new LWP::UserAgent;
    my $header =['Content-Type' =>'application/json; charset=UTF-8'];
    my $request = new HTTP::Request('GET',$url, $header);
    my $response = $userAgent->request($request);
    # print Dumper $response;
    my $return_data;
    if( $response->is_success ) {
        $return_data = {
            data   => decode_json( $response->{'_content'} ),
            status => 1,
        }
    } 
    else {
        $return_data = {
            message => $response->message,
            status  => 0,
        }
    } 
    return $return_data;
}


sub dateRangeFetch{
    my $object = shift;
    my $country = $object->{country};
    my $fromDate = $object->{start_date};
    my $toDate = $object->{end_date};
    # my %response;
    my $url = URL."country/$country?from=".$fromDate."&to=".$toDate;
    my $covid_data = creatingConnectionsWithAPI($url);
    print Dumper $covid_data;
    return $covid_data;
}

sub specificDateFetch{
	my $object= shift;
	my $country = $self->{country};
    my $fromDate = $self->{start_date};
    # my %response;
    my $url = URL."country/$country?from=".$fromDate."T00:00:00Z&to=".$fromDate."T12:00:00Z";
    my $covid_data = creatingConnectionsWithAPI($url);
    print Dumper $covid_data;
    return $covid_data;
}

1;