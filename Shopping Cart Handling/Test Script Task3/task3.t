#!/usr/bin/perl use 5.010;
use strict;
use warnings;
use Test::More;
use Data::Dumper;
use Test::Deep;
use lib"C:/Users/MOHD MONISH/Desktop/Task/PERL/Task3";

BEGIN {
    use_ok("CartModules") or die "Unable to open $! ($@)"
};

# Note: 
# check the database before execution of Test Scipt/ Some hardcode values used from database in 
# stock add / stock delete / cart add / cart delete.

# subtest "ADD ITEMS TO STOCK/ addStockItems" => sub{
#     my $item_name = "Water Bottle";
#     my $price_PU = 50;
#     my $tax_amount = 5;
#     my $obj = new CartModules();
#     my $id = $obj->addStockItems($item_name, $price_PU, $tax_amount);
#     my $expected_output = 1 if ($id);
#     ok(1 == $expected_output, "TEST IS OKAY") or diag explain $id;
# };

# subtest "DELETE ITEM FROM STOCK/ deleteStockItems"=> sub{
#     my $item_name = "Clock";
#     my $obj = new CartModules();
#     my $test_output = $obj->deleteStockItems($item_name);
#     my $expected_output = "Item deleted from stock\n";
#     ok($test_output eq $expected_output, "TEST IS OKAY") or diag explain $test_output;
# };

# subtest "ADD ITEMS TO Cart/ addCartItems" => sub{
#     my $item_name = "Brush";
#     my $qty = 5;
#     my $obj = new CartModules();
#     my $id = $obj->addCartItems($item_name, $qty);
#     my $expected_output = 1 if ($id);
#     ok(1 == $expected_output, "TEST IS OKAY") or diag explain $id;
# };

# subtest "DELETE ITEM FROM CART/ deleteCartItems"=> sub{
#     my $item_name = "Television";
#     my $obj = new CartModules();
#     my $test_output = $obj->deleteCartItems($item_name);
#     my $expected_output = "Item Deleted From Cart\n";
#     ok($test_output eq $expected_output, "TEST IS OKAY") or diag explain $test_output;
# };

# subtest "FETCH CART ITEMS / selectAllCartItems"=> sub{
#     my $expected_output = {
#           'Brush' => {
#                        'TaxAmount' => 15,
#                        'Sno' => 55,
#                        'qty' => 5,
#                        'ItemName' => 'Brush',
#                        'Price' => 200
#                      },
#           'Spects' => {
#                         'TaxAmount' => 250,
#                         'Price' => 2600,
#                         'ItemName' => 'Spects',
#                         'qty' => 1,
#                         'Sno' => 54
#                       },
#           'Bread' => {
#                        'TaxAmount' => 50,
#                        'ItemName' => 'Bread',
#                        'Price' => 350,
#                        'Sno' => 46,
#                        'qty' => 10
#                      },
#           'Clock' => {
#                        'Sno' => 47,
#                        'qty' => 7,
#                        'ItemName' => 'Clock',
#                        'Price' => 10500,
#                        'TaxAmount' => 350
#                      },
#           'Wrist Watch' => {
#                              'Sno' => 52,
#                              'qty' => 2,
#                              'ItemName' => 'Wrist Watch',
#                              'Price' => 16000,
#                              'TaxAmount' => 3000
#                            },
#           'Invertor' => {
#                           'TaxAmount' => 3900,
#                           'Price' => 45000,
#                           'ItemName' => 'Invertor',
#                           'qty' => 3,
#                           'Sno' => 50
#                         }
#         };
#     my $obj = new CartModules();
#     my $test_output = $obj->selectAllCartItems();
#     is_deeply($test_output, $expected_output, "TEST IS OKAY");
# };

# subtest "CHANGE QUANTITY IN CART / cartQuantityChange"=> sub{
#     my $expected_output = "Quantity Updated in cart\n";
#     my $item_name = "Invertor";
#     my $qty = 2;
#     my $obj = new CartModules();
#     my $test_output = $obj->cartQuantityChange($item_name, $qty);
#     ok($test_output eq $expected_output, "TEST IS OKAY") or diag explain $test_output;
# };

subtest "TOTAL CART AMOUNT / totalCartAmount"=> sub{
    my $expected_output = 104650;
    my $obj = new CartModules();
    my $test_output = $obj->totalCartAmount();
    ok($test_output == $expected_output, "TEST IS OKAY") or diag explain $test_output;
};

subtest "TOTAL TAX AMOUNT IN CART / totalCartTaxAmount"=> sub{
    my $expected_output = 10165;
    my $obj = new CartModules();
    my $test_output = $obj->totalCartTaxAmount();
    ok($test_output == $expected_output, "TEST IS OKAY") or diag explain $test_output;
};

done_testing();