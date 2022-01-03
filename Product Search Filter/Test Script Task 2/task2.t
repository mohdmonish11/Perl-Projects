#!/usr/bin/perl use 5.010;
use strict;
use warnings;
use Test::More;
use Data::Dumper;
use Test::Deep;
use lib"C:/Users/MOHD MONISH/Desktop/Task/PERL/Task2";

BEGIN {
    use_ok("Items") or die "Unable to open $! ($@)"
};

# subtest "Insert/ additems" => sub{
#     my $price = 50;
#     my $category = "Toffee";
#     my $brand = "parle";
#     my $obj = new Items();
#     my $id = $obj->addItems($price, $category, $brand);
#     my $expected_output = 1 if ($id);
#     ok(1 == $expected_output, "TEST IS OKAY") or diag explain $id;
# };

subtest "GetValues BY PRICE"=> sub{
    my $expected_output = [[12, 8, 'Notebook','Classmate'],[19,7,'Pencil','Natraj'],
                            [20,9,'Pencil','Sparker']];
    my $type= "Price";
    my $start_range = 5;
    my $end_range = 10; 
    my $obj = new Items();
    my $test_output = $obj->getItems($type, $start_range, $end_range);
    is_deeply($test_output, $expected_output, "TEST IS OKAY");
};

subtest "GetValues BY CATEGORY"=> sub{
    my $expected_output = [[17,5,'Pencil','HB'],[18,10,'Pencil','Camel'],[19,7,'Pencil','Natraj'],
                            [20, 9,'Pencil','Sparker']];
    my $type= "Category";
    my $category_name = "Pencil";
    my $obj = new Items();
    my $test_output = $obj->getItems($type, $category_name);
    is_deeply($test_output, $expected_output, "TEST IS OKAY");
};

subtest "GetValues BY BRAND"=> sub{
    my $expected_output = [[18,10,'Pencil','Camel'],[24,25,'Rubber','Camel']];
    my $type= "Brand";
    my $brand_name = "Camel";
    my $obj = new Items();
    my $test_output = $obj->getItems($type, $brand_name);
    is_deeply($test_output, $expected_output, "TEST IS OKAY");
};

subtest "INVALID GET OUTPUT CHECK"=> sub{
    my $expected_output = "INVALID SEARCH";
    my $input= "asmcasnkcn";
    my $obj = new Items();
    my $test_output = $obj->getItems($input);
    ok($test_output eq $expected_output, "TEST IS OKAY") or diag explain $test_output;
    # is_deeply($test_output, $expected_output, "TEST IS OKAY");
};

done_testing();