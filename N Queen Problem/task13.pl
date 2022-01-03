#!/usr/bin/perl use 5.010;
use strict;
use warnings;
use lib"C:/Users/monish.m/Desktop/Task/Perl/task13";  
use ChessBoard;

my $object = new ChessBoard();

sub createboard{
  my $n = shift;
  my @sub_array;
  my @board;
  for (1..$n){
    push (@sub_array, 0);
  }
  for (1..$n){
    push (@board, [@sub_array]);
  }
  return @board;
}

print"Enter the value of N for board: ";
chomp(my $n=<STDIN>); 
my @board = createboard($n);    # Creating the matrix

#Calling the Function 
$object->acceptingPassedValues($n, @board);
