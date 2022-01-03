#!/usr/bin/perl use 5.010;
use strict;
use warnings;
use Test::More;
use Data::Dumper;
use Test::Deep;
use lib"C:/Users/MOHD MONISH/Desktop/Task/PERL/Task8/with CGI integration";

BEGIN {
    use_ok("Github") or die "Unable to open $! ($@)"
};


subtest "Github API CHECK/ GithubApi" => sub{
    my $keyword = "CoreyMSchafer";
    my $expected_output = {
          'username' => 'CoreyMSchafer',
          'followers' => 9086,
          'RepoName' => {
                          'forks_count' => {
                                             'game-of-life' => 15,
                                             'code_snippets' => 14705,
                                             'dotfiles' => 493,
                                             'Sample-Repo' => 18,
                                             'CoreyMS-Genesis-Theme' => 10
                                           },
                          'stargazers_count' => {
                                                  'Sample-Repo' => 13,
                                                  'dotfiles' => 609,
                                                  'CoreyMS-Genesis-Theme' => 8,
                                                  'code_snippets' => 7550,
                                                  'game-of-life' => 15
                                                }
                        },
          'avatar_url' => 'https://avatars.githubusercontent.com/u/4048251?v=4',
          'public_repos' => 5
        };
    my $obj = new Github();
    my $test_output = $obj->getUserInfo($keyword);
    is_deeply($test_output,$expected_output, "TEST IS OKAY");
};

subtest "INVALID INPUT CHECK/ GithubApi" => sub{
    my $expected_output = "Not Found";
    my $keyword = "naslcndc";
    my $obj = new Github();
    my $value = $obj->getUserInfo($keyword);
    ok($value eq $expected_output, "TEST IS OKAY") or diag explain $value;
};

done_testing();