#!/usr/bin/perl use 5.010;
package ChessBoard;
use strict;
use warnings;

#condition: Every Queen has specific row, Every query has specific column , they are not in a same diagonal
#used Back Tracking 

sub new{
    my $class = shift;
    my $self = {};
    return bless $self, $class;
}

sub acceptingPassedValues{
    my $object= shift;
    my($n, @board) = @_;
    # print $n,"\n";
    # print Dumper @board;
    # $object->nQueenSetup(0,$n, @board)
    if ($n <=10 && $n >1){
        if (($object->nQueenSetup(0,$n,@board))){
            my $length = @board;
            for (my $i=0; $i<$length; $i++){
                for (my $j=0; $j<$length; $j++){
                    print $board[$i][$j];
                }
                print"\n";
            }
        }
    } else{
        print"Please Enter the number Between 1 to 10";
    }
}

sub nQueenSetup{
    my $object = shift;
    my ($x, $n, @board) = @_;
    if($x >= $n){
        return 1;
    }
    for (my $col=0 ; $col<$n ; $col++){
        if ($object->isSafePositionCheck($x,$col,$n,@board)){ #(check if queen isn't the safe position or not)
            $board[$x][$col] = 1;
            if($object->nQueenSetup($x +1,$n, @board)){
                return 1;
            }
            $board[$x][$col] = 0;    
            #backing (putting the value to 0 and going back for further check if no suitable place is found)
        }
    }
    return 0;
}

sub isSafePositionCheck{
    my $object = shift;
    my ($x, $y, $n, @board) = @_;

    # print $x,"\t", $y, "\t",$n,"\n";
    # print Dumper @board;

    for (my $i =0; $i<$x ; $i++){
        if($board[$i][$y]){
            return 0;
        }
    }
    my $row = $x;
    my $col = $y; 
    while($row >= 0 && $col >=0){       #Checking for the upper left diagonal element
        if(($board[$row][$col])== 1){
            return 0;
        }
        $row-=1;
        $col-=1;
    }
    $row =$x;
    $col =$y;
    while($row >= 0 && $col <$n){       #Checking for the Upper right diagonal element
        if(($board[$row][$col]) == 1){
            return 0;
        } 
        $row-=1;
        $col+=1;
    }
    return 1;
}

1;
