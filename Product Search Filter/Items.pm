#!/usr/bin/perl use 5.010;

package Items;
use strict;
use DBI;
use Data::Dumper;
use warnings;
#use Exporter;

# our @ISA =qw (Exporter);
# our @Export = qw(addItems getItems);
# our @EXPORT_OK = qw(addItems getItems);

#TASK:- Implement a search filter to find products in a given price range, category, brand.
#You can have the list of products in a csv file or database. 
#Eg:- We can assume that the selected price range is low = 7 and high = 20,
# so our function solution should only return the product details with  prices {9, 8, 14, 20, 17}. 


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

# my $object = shift;

sub addItems{
    my $object = shift;
    my ($price,$category,$brand) = @_;
    my $insert_product_statement= "INSERT INTO products (Price, Category, Brand)Values(?,?,?)";
    if(!$object->{insert_query}){
        $object->{insert_query} = $object->{connection}->prepare($insert_product_statement);
    }
    $object->{insert_query} -> execute($price, $category, $brand) or die $DBI::errstr;      
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
    }  
    $object->{select_query} =$object->{connection}->prepare($query);
    $object->{select_query}->execute(@params);
    my $filter_data = $object->{select_query}->fetchall_arrayref();
    return $filter_data;
}

# $object->{connection}->disconnect();

1;


#Notes
=head
#$connection -> commit or die $DBI::errstr;         # Auto Commit Enabled that's why we cannot use commit......
                       # how to use fetchrow_hashref
while(my $hashrow= $select_query->fetchrow_hashref()){
    print Dumper($hashrow);
}
=cut