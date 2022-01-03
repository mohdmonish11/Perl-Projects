#!/usr/bin/perl use 5.010;
use strict;
use warnings;
use lib"C:/Users/monish.m/Desktop/Task/Perl/task13/edited";  
use ChessBoard;
use Data::Dumper;



print"Enter the value of N for board: ";    #user input
chomp(my $n=<STDIN>); 
   #creating the matrix


sub acceptingPassedValues{
    my $n = shift;
    if ($n <=10 && $n >3){
        my $object = ChessBoard->new({
                    n => $n
                });
        $object->boardCreation();
        if (($object->nQueenSetup(0))){
            my $length = $n;
            for (my $i=0; $i<$length; $i++){    # printing the output
                for (my $j=0; $j<$length; $j++){
                    print $object->{board}[$i][$j],"  ";
                }
                print"\n";
            }
        }
    } elsif($n >=1 && $n<=3){
        print "No output is for 1 to 3";
    } else{
        print"Please Enter the number Between 1 to 10";
    }
}

acceptingPassedValues($n); # Validing and printing the result
