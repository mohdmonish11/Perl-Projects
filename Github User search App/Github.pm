#!/usr/bin/perl use 5.010;
package Github;
use strict;
use warnings;
use Data::Dumper;
use LWP::UserAgent;
use HTTP::Request();
use JSON;
use constant URL => 'https://api.github.com/users/';

sub new{
    my $class= shift;
    my $self = {};
    return bless $self,$class;
}


sub creatingConnectionsWithAPI{
    my ($user_name) = shift;
    my $url= URL.$user_name;
    my $userAgent = new LWP::UserAgent;
    my $header =['Content-Type' =>'application/json; charset=UTF-8'];
    my $request = new HTTP::Request('GET',$url, $header);
    my $response = $userAgent->request($request);
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

sub getUserInfo{
    my $object = shift;
    my $user_name=$_[0];
    my $url;
    my $data = creatingConnectionsWithAPI($user_name);
    my $fetch_data;
    if ($data->{status}){
        if ($data->{data}){
            $fetch_data = $data->{data};

            my %fetch_data = %{$fetch_data};    #derefrencing 
            my %fetched_data_hash;
            for my $keys(keys %fetch_data){
                if ($keys eq 'login'){
                    $fetched_data_hash{'username'} = $fetch_data->{$keys};
                    
                }
                elsif($keys eq 'avatar_url'){
                    $fetched_data_hash{'avatar_url'} = $fetch_data{$keys};
                }
                elsif($keys eq 'followers'){
                    $fetched_data_hash{'followers'} = $fetch_data{$keys};
                    
                }
                elsif($keys eq 'public_repos'){
                    $fetched_data_hash{'public_repos'} = $fetch_data{$keys};
                }
                elsif($keys eq 'repos_url'){
                    $user_name =~ s/\r//g;      # \r carrage return
                    $user_name .= "/repos";
                    my $fetch_data = creatingConnectionsWithAPI($user_name);
                    for my $data(@{$fetch_data->{data}}){
                        my $repo_name =$data->{'name'};
                        $fetched_data_hash{'RepoName'}{'forks_count'}{$repo_name} = $data->{'forks_count'};
                        $fetched_data_hash{'RepoName'}{'stargazers_count'}{$repo_name} = $data->{'stargazers_count'};
                    }
                }
            }
            return \%fetched_data_hash;
        }
    }
    else{
        return $data->{message};
    }       
}

1;