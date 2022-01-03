#!/usr/bin/perl -w

package Unsplash;
use LWP::UserAgent;
use HTTP::Request();
use JSON::PP qw( encode_json decode_json );


sub new{
    my $class = shift;
    my $self ={};
    return bless $self, $class;
}

sub unsplashApi{
    my $object = shift;
    my $keyword = $_[0];
    # my %link;  
    # my $counter = 1;
    my @link; 
    my $url = "https://api.unsplash.com/search/photos?query=".$keyword."&client_id=CRhBk-HIg4ien3ip1tMyvzLD9Bu9biYvTlFiLxjs-AI";
    
    my $userAgent = new LWP::UserAgent;
    my $header = ['Content-Type' => 'application/json; charset=UTF-8'];
    my $request= new HTTP::Request('GET', $url, $header);
    my $response = $userAgent->request($request);
    # print Dumper($response);
    my $images_data= decode_json($response->{'_content'});
    # print Dumper($images_data);
    # print ref $images_data->{'results'};
    for my $data(@{$images_data->{'results'}}){
        # print $data->{'urls'}{'small'},"\n";
        push(@link, $data->{'urls'}{'small'});
        # $link{$counter} = $data->{'urls'}{'small'};
        # $counter+=1;
    }
    if (@link){
        return @link;
    }
    else{
        return "Invalid Input\n";
    }    
}
 
1;