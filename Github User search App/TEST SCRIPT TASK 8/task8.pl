#!/usr/bin/perl -w
# use lib"/home4/tqmohamm/public_html/cgi-bin";
use lib "C:/Users/MOHD MONISH/Desktop/Task/PERL/Task8/with CGI integration";  
use strict;
use warnings;
use CGI;
use Github;
use Data::Dumper;

my $object = new Github();

# chomp(my $user_name = <STDIN>); 

# my $github_data = $object->getUserInfo($user_name);
# print Dumper $github_data;


my $cgi = CGI->new();
print $cgi->header;

my $html_start = <<'START';
<html>
    <head>
    <title>Github Profile</title>
    </head>
    <body style="margin-left:5%; padding:20px;">
    <p><h1>Data Fetch From Github</h1></p>
    <form action="/cgi-bin/task8.pl" method="get">
        Please Enter the Username:  <input type="text" name="username">&nbsp;&nbsp;
        <input type="submit">
    </form>
START
print $html_start;

my $user_name = $cgi->param('username');

my $github_data = $object->getUserInfo($user_name);

if (ref $github_data eq 'HASH'){
    my %data = %{$github_data};
    for my $keys(sort keys %data){
        if ($keys eq 'avatar_url'){
            print "<h2>Avatar Image:</h2> <img src= '$data{'avatar_url'}' alt='Search Image not Found'> <br>";
        }
        elsif ($keys eq 'username'){
            print "<h2>Username: $data{'username'}</h2><br>";
        }
        elsif ($keys eq 'public_repos'){
            print "<h2>Total No. of Repository: $data{'public_repos'}</h2><br>";
        }
        elsif ($keys eq 'followers'){
            print "<h2>Total No. of Followers: $data{'followers'}</h2><br>";
        }
        elsif ($keys eq 'RepoName'){
            my $counter = 1;
            for my $repo_key (keys %{$data{'RepoName'}}){
                print"<h2>$repo_key </h2>";
                for my $value (sort {$data{'RepoName'}{$repo_key}{$b} <=> $data{'RepoName'}{$repo_key}{$a}} 
                                    keys %{$data{'RepoName'}{$repo_key}}){
                    print"<h4>$value: $data{'RepoName'}{$repo_key}{$value}</h4>";
                    $counter++;
                    last if( $counter >= 5)
                }
                $counter = 1;
            }
        }   
    }
}
else{
    if ($user_name){
        print "<h2>$github_data</h2>";
    }
}

my  $html_end = <<'END';
</body>
</html>
END
print $html_end;


