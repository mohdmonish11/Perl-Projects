#!/usr/bin/perl use 5.010;
use strict;
use warnings;
use Test::More;
use Data::Dumper;
use Test::Deep;
use lib 'C:/Users/monish.m/Desktop/Task/Perl/task13/edited';

package New{
    require 'task13.pl';
}

BEGIN {
    use_ok("ChessBoard") or die "Unable to open $! ($@)";
}

subtest "Chessboard N= 4 Testing" => sub{
    my $expected_ouput =[[0,'Q',0,0],[0,0,0,'Q'],['Q',0,0,0],[0,0,'Q',0]];
    my $n = 4;
    my $board_obj = my $object = ChessBoard->new({
                    n => $n
                });
    $board_obj->boardCreation($n);
    $board_obj->nQueenSetup(0);
    my $test_ouput = $board_obj->{board};
    is_deeply($test_ouput,$expected_ouput, "Correct Output");
};


subtest "Chessboard N= 2 Testing" => sub{
    my $expected_ouput = "No output is for 1 to 3";
    my $n = 2;
    my $test_ouput = New::acceptingPassedValues($n); 
    ok ($test_ouput eq $expected_ouput, 'Correct Output') or diag explain $test_ouput;
};

subtest "Chessboard N= 15 Testing" => sub{
    my $expected_ouput = "Please Enter the number Between 1 to 10";
    my $n = 15;
    my $test_ouput = New::acceptingPassedValues($n);  
    ok ($test_ouput eq $expected_ouput, 'Correct Output') or diag explain $test_ouput;
};

subtest "Chessboard N= ! " => sub{
    my $expected_ouput = "Invalid Characters";
    my $n = '!';
    my $test_ouput = New::acceptingPassedValues($n);  
    ok ($test_ouput eq $expected_ouput, 'Correct Output') or diag explain $test_ouput;
};

done_testing();