#!/usr/bin/perl use 5.010;
package ChessBoard;
use strict;
use warnings;
use Data::Dumper;

#condition: Every Queen has specific row, Every query has specific column , they are not in a same diagonal
#used Back Tracking 

sub new{
    my ($class, $args) = @_;
    my $self = {
        n =>$args->{n},
        board => undef,
    };
    return bless $self, $class;
}


sub boardCreation{
    my $object = shift;
    my $n = $object->{n};
    my @matrix = map{[map{0}(1..$n)]}(1..$n);
    $object->{board} = \@matrix;        #referencing an array
}


sub nQueenSetup{
    my $object = shift;
    my $horizontal = $_[0];
    my $n = $object->{n};

    if($horizontal >= $n){
        return 1;
    }
    for (my $col=0 ; $col<$n ; $col++){
        if ($object->isSafePositionCheck($horizontal,$col)){ #(check if queen isn't the safe position or not)
            $object->{board}[$horizontal][$col] = 'Q';
            if($object->nQueenSetup($horizontal +1)){
                return 1;
            }
            $object->{board}[$horizontal][$col] = 0;    
            #backing (putting the value to 0 and going back for further check if no suitable place is found)
        }
    }
    return 0;
}

sub isSafePositionCheck{
    my $object = shift;
    my ($horizontal, $vertical) = @_;
    my $n = $object->{n};

    for (my $i =0; $i<$horizontal ; $i++){
        if($object->{board}[$i][$vertical]){
            return 0;
        }
    }
    my $row = $horizontal;
    my $col = $vertical; 
    while($row >= 0 && $col >=0){       #Checking for the upper left diagonal element
        if(($object->{board}[$row][$col]) eq 'Q'){
            return 0;
        }
        $row-=1;
        $col-=1;
    }
    $row =$horizontal;
    $col =$vertical;
    while($row >= 0 && $col <$n){       #Checking for the Upper right diagonal element
        if(($object->{board}[$row][$col]) eq 'Q'){
            return 0;
        } 
        $row-=1;
        $col+=1;
    }
    return 1;
}

1;
