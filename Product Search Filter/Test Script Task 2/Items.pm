#!/usr/bin/perl use 5.010;
package Items;
use strict;
use DBI;
use Data::Dumper;
use warnings;

# my $connection = DBI->connect('DBI:mysql:product:localhost','root','') or die $DBI::errstr;

sub new{
    my $class =shift;
    my $connection = DBI->connect('DBI:mysql:product:localhost','root','') or die $DBI::errstr;
    my $self={
        connection=> $connection,
        insert_query => undef,
        select_query => undef, 
    };
    return bless $self, $class;
}

sub addItems{
    my $object = shift;
    my ($price,$category,$brand) = @_;
    my $insert_product_statement= "INSERT INTO products (Price, Category, Brand)Values(?,?,?)";
    if(!$object->{insert_query}){
        $object->{insert_query} = $object->{connection}->prepare($insert_product_statement);
    }
    $object->{insert_query} -> execute($price, $category, $brand) or die $DBI::errstr;
    my $id = $object->{insert_query}->{mysql_insertid};
    return $id;      
}


sub getAllItems{
    my $object = shift;
    my $select_product_statement = 'SELECT * from products';
    $object->{select_query} = $object->{connection}->prepare($select_product_statement);
    $object->{select_query}->execute();
    print "List of Items You Have: \n";
    print "SNo  Price \t Category  \t\t Brand\n";
    while(my @row =$object->{select_query}->fetchrow_array()){
        print $row[0],")    ",$row[1],"\t\t",$row[2],"\t\t\t",$row[3],"\n";
    }
}

sub getItems{
    my $object =shift;
    my ($input, $start_range, $end_range) = @_;
    my @params;
    my $query= "SELECT * from products";

    if (lc($input) eq 'price'){
        $query.= " where Price > ? and Price < ?";
        push(@params, $start_range, $end_range);
    }
    elsif(lc($input) eq 'category'){
        $query.= " where Category = ?";
        push(@params, $start_range);
    }
    elsif(lc($input) eq 'brand'){
        $query.= " where Brand = ?";
        push(@params, $start_range);  
    } else{
        return "INVALID SEARCH";
    }
    $object->{select_query} =$object->{connection}->prepare($query);
    $object->{select_query}->execute(@params);
    my $filter_data = $object->{select_query}->fetchall_arrayref();
    return $filter_data;
}

1;

