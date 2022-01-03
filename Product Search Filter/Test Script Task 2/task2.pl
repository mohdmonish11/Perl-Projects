#!/usr/bin/perl use 5.010;
use strict;
use warnings;
use DBI;
use Data::Dumper;
use lib "C:/Users/MOHD MONISH/Desktop/Task/PERL/Task2";
use Items;

my $object = new Items();

# addItemsValuesPassed();

sub addItemsValuesPassed{
    while(1){
        print"Press 1 to exit and 2 for entry: ";
        my $user=<STDIN>;
        if ($user == 2){
            print"Enter the Price of the Product: ";
            chomp(my $price=<STDIN>);  
            print "Enter the Category: ";
            chomp(my $category =<STDIN>);
            print"Enter the Brand name: ";
            chomp(my $brand =<STDIN>);
            $object->addItems($price,$category,$brand);
        }
        last if ($user == 1);
    }
    $object->{insert_query}->finish() if($object->{insert_query});
}

getValuesOfItems();


sub getValuesOfItems{
    $object->getAllItems();
    my ($start_range, $end_range);
    my $data;
    print "Specific Result will Show: Search by Price/Category/Brand: ";
    chomp(my $input =<STDIN>);
    if (lc($input) eq "price"){
        print "Enter the start Range: ";
        $start_range =<STDIN>;
        print "Enter the End Range: ";
        $end_range =<STDIN>;
        $data= $object->getItems($input,$start_range,$end_range);
    }
    elsif (lc($input) eq "category"){
        print "Enter the Category name: ";
        chomp(my $category_name =<STDIN>);
        $data= $object->getItems($input,$category_name);
    } elsif(lc($input) eq "brand"){
        print "Enter the Brand name: ";
        chomp(my $brand_name =<STDIN>);
        $data= $object->getItems($input,$brand_name);
    }
    print Dumper($data);
    $object->{select_query}->finish();
}
