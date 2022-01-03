#!/usr/bin/perl use 5.010;
use strict;
use warnings;
use Test::More;
use lib 'C:/Users/monish.m/Desktop/Task/Perl/task7';

package New{
    require 'task7.pl';
}

subtest "Output must be 15" =>sub{
    my $expected_ouput = 15;
    my $input = "XV";
    my $output = New::romanToDecimalConvertor($input);
    ok ($output eq $expected_ouput, "Correct") or diag explain $output;
};

subtest "Ouput must be 1000" =>sub{
    my $expected_ouput = 1000;
    my $input = "M";
    my $output = New::romanToDecimalConvertor($input);
    ok ($output eq $expected_ouput, "Correct") or diag explain $output;
};

subtest "Ouput must be 1500" =>sub{
    my $expected_ouput = 1500;
    my $input = "DM";
    my $output = New::romanToDecimalConvertor($input);
    ok ($output eq $expected_ouput, "Correct") or diag explain $output;
};
subtest "Ouput must be 900" =>sub{
    my $expected_ouput = 900;
    my $input = "CM";
    my $output = New::romanToDecimalConvertor($input);
    ok ($output eq $expected_ouput, "Correct") or diag explain $output;
};

subtest "Invalid Input" =>sub{
    my $expected_ouput = "Invalid Input";
    my $input = "Q";
    my $output = New::romanToDecimalConvertor($input);
    ok ($output eq $expected_ouput, "Test is Okay") or diag explain $output;
};

done_testing();