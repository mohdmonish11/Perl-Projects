#!/usr/bin/perl use 5.010;
use Moose;
use Data::Dumper;
use Test::More;
use Test::Deep;
use lib"C:/Users/monish.m/Desktop/Task/Perl/Task10";



BEGIN {
    use_ok("Evaluate") or die "Unable to open $! ($@)";
}

subtest "Testing for Leap Years"=> sub{
    my $expected_ouput = {
          '2008' => 'leap',
          '2000' => 'leap',
          '2004' => 'leap'
        };
    my $start_input_year = 2000;
    my $end_input_year = 2010;
    my $test_ouput = Evaluate::findLeapYears($start_input_year, $end_input_year);
    is_deeply($test_ouput, $expected_ouput, "Testing for Leap Years");
    # ok ($test_ouput == $expected_ouput, 'Correct Output') or diag explain $test_ouput;

};

subtest "Testing for Sundays"=> sub{
    my $expected_ouput = 171;
    my $start_input_year = 1901;
    my $end_input_year = 2000;
    my $leap_year = Evaluate::findLeapYears($start_input_year, $end_input_year);
    my $test_ouput = Evaluate::findingSunday($start_input_year, $end_input_year, $leap_year);
    # is_deeply($test_ouput, $expected_ouput, "Testing for Leap Years");
    ok ($test_ouput == $expected_ouput, 'Correct Output') or diag explain $test_ouput;

};

done_testing();