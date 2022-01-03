#!/usr/bin/perl use 5.010;
use strict;
use warnings;
use Data::Dumper;
use lib"C:/Users/MOHD MONISH/Desktop/Task/PERL/Task3";  #where the module is saved
use CartModules;


my $object =new CartModules();

while(1){
    my $object =new CartModules();
    print"Press 1 for add items to stocks\n";
    print"Press 2 to delete items from stock\n";
    print"Press 3 to add items to cart\n";
    print"Press 4 delete items from cart\n";
    print"Press 5 to fetch items from cart\n";
    print"Press 6 to change cart Quantity\n";
    print"Press 7 to get total cart amount\n";
    print"Press 8 to get total tax amount for cart\n";
    print"Press 0 to exit\nChoose Wisely:";
    my $input=<STDIN>;
    if ($input == 1){
        getAddStockItems();
    }
    elsif($input == 2){
        deleteItemsFromStock();
    }
    elsif($input == 3){
        addItemsToCart();
    }
    elsif($input == 4){
        deleteItemsFromCart();   
    }
    elsif($input == 5){
        fetchItemsFromCart();
    }   
    elsif($input == 6){
        changeCartQuantity();
    }
    elsif($input == 7){
        $object->totalCartAmount();
    }
    elsif($input == 8){
        $object->totalCartTaxAmount();
    }
    last if ($input == 0);
}


sub getAddStockItems {
    while(1){
        print"Press 1 for Item Entry:  & 2 for exit..... ";
        my $items=<STDIN>;
        if ($items == 1){
            print"Enter Item Name: ";
            chomp(my $item_name=<STDIN>);  
            print "Enter Price per unit: ";
            chomp(my $price_per_unit =<STDIN>);
            print"Tax amount on item: ";
            chomp(my $tax_amount =<STDIN>);
            $object->addStockItems($item_name, $price_per_unit, $tax_amount);
        }
        last if ($items == 2);
    }
    $object->{insert_query}->finish() if($object->{insert_query});
}

sub deleteItemsFromStock{
    my $data = $object->selectAllStockItems();
    print Dumper $data;
    print "ITEM NAME TO REMOVE FROM STOCK: ";
    chomp(my $input =<STDIN>);
    $object->deleteStockItems($input);
}

sub addItemsToCart{
    my $data = $object->selectAllStockItems();
    print Dumper $data;
    print"Enter the name of item to add to cart: ";
    chomp(my $input_item_name = <STDIN>);
    print"Enter the no. of quantity you wanna bought: ";
    chomp(my $quantity = <STDIN>);
    $object->addCartItems($input_item_name , $quantity);
}

sub deleteItemsFromCart{
    my $data = $object->selectAllCartItems();
    print Dumper $data;
    print "Item Name to remove it from cart: ";
    chomp(my $input =<STDIN>);
    $object->deleteCartItems($input);
}

sub fetchItemsFromCart{
    my $data = $object->selectAllCartItems();
    print Dumper $data;
}

sub changeCartQuantity{
    print"Here is all the items Currently present in your cart ";
    my $data = $object->selectAllCartItems();
    print Dumper $data;
    print "Enter the Product/ItemName for which you Wanna Change the Qty: ";
    chomp(my $itemName =<STDIN>);
    print"Enter the no. of quantity: ";
    chomp(my $quantity =<STDIN>);
    $object->cartQuantityChange($itemName, $quantity);
}
