#!/usr/bin/perl use 5.010;

package CartModules;
use DBI;
use Data::Dumper;
use Moose;

sub new{
    my $class =shift;
    my $connection = DBI->connect('DBI:mysql:handlecart:localhost','root','') or die $DBI::errstr;
    my $self={
        connection=> $connection,
        insert_query => undef,
        select_query => undef, 
        delete_query=> undef,
        update_query => undef,
        select_cart_query => undef,
        delete_cart_query => undef,
    };
    return bless $self, $class;
}

sub addStockItems{
    my $object = shift;
    my ($item_name, $price_per_unit, $tax_amount) = @_;
    my $insert_statement ="INSERT INTO stockitems(ItemName, PricePerUnit, TaxAmount)Values(?,?,?)";
    if(!$object->{insert_query}){
        $object->{insert_query}= $object->{connection}->prepare($insert_statement);
    }
    $object->{insert_query}->execute($item_name, $price_per_unit, $tax_amount) or die $DBI::errstr;
    print"Item added to stock\n";
}


sub deleteStockItems{
    my $object = shift;
    my $delte_item_name = $_[0];
    $object->{select_query} = $object->{connection}->prepare('SELECT ItemName from stockitems Where ItemName=?');
    my $delete_statement= "DELETE FROM stockitems WHERE ItemName= ? LIMIT 1";
    $object->{select_query}->execute($delte_item_name) or die $DBI::errstr;
    my $stock_data =$object->{select_query}->fetchrow();
    $object->{select_query}->finish();

    if ($stock_data){
        if(!$object->{delete_query}){
            $object->{delete_query} =$object->{connection}->prepare($delete_statement);
        }
        $object->{delete_query}->execute($delte_item_name) or die $DBI::errstr;
        print "Item deleted from stock\n";
    }
    $object->{delete_query}->finish() if ($object->{delete_query});
}


sub selectAllCartItems{
    my $object = shift;
    $object->{select_cart_query} = $object->{connection}->prepare('SELECT * from cart_items');
    $object->{select_cart_query}->execute() or die $DBI::errstr;
    my $cart_data = $object->{select_cart_query}->fetchall_hashref('ItemName');
    return $cart_data;
}


sub selectAllStockItems{
    my $object = shift;
    $object->{select_query} = $object->{connection}->prepare('SELECT * from stockitems');
    $object->{select_query}->execute() or die $DBI::errstr;
    my $stock_data =$object->{select_query}->fetchall_hashref('ItemName');
    return $stock_data;
}

sub addCartItems{
    my $object = shift;
    my ($input_item_name , $quantity) = @_;
    my $insert_statement = "INSERT INTO cart_items (ItemName, Price, qty, TaxAmount) Values(?,?,?,?)";
    my $cart_data = $object->selectAllCartItems();
    my $stock_data = $object->selectAllStockItems();
    if (exists($cart_data->{$input_item_name})){
        print"Item Already Exist for Quantity Change Press 6\n";
    }
    else{
        if (exists($stock_data->{$input_item_name})){
            if(!$object->{insert_query}){
                $object->{insert_query} = $object->{connection}->prepare($insert_statement);
            }
            my $item_name = $stock_data->{$input_item_name}{'ItemName'};
            my $price = $stock_data->{$input_item_name}{'PricePerUnit'};
            my $qty = $quantity;
            my $tax_amount = $stock_data->{$input_item_name}{'TaxAmount'};
            $object->{insert_query}->execute($item_name,($price*$qty),$qty,($tax_amount*$qty)) or die $DBI::errstr;
            print "Data Inserted in cart\n";
            $object->{insert_query}->finish() if($object->{insert_query});
        }
    }
}


sub deleteCartItems{
    my $object = shift;
    my $input = $_[0];
    my $cart_data = $object->selectAllCartItems();
    if (exists($cart_data->{$input})){
        if (!$object->{delete_cart_query}){
            $object->{delete_cart_query} =$object->{connection}->prepare("DELETE FROM cart_items WHERE ItemName= ? LIMIT 1");
        }
        $object->{delete_cart_query}->execute($input) or die $DBI::errstr;
        print"Item Deleted From Cart\n";
    }
    $object->{delete_cart_query}->finish() if ($object->{delete_cart_query});
}

sub cartQuantityChange{
    my $object = shift;
    my $update_statement= "UPDATE cart_items SET Price=?, qty=?, TaxAmount=?  WHERE ItemName =? LIMIT 1";
    my ($item_name, $quantity) = @_;
    my $cart_data = $object->selectAllCartItems();
    if (exists($cart_data->{$item_name})){
        if(!$object->{update_query}){
            $object->{update_query} = $object->{connection}->prepare($update_statement);
        }
        my $item_name = $cart_data->{$item_name}{'ItemName'};
        my $price = $cart_data->{$item_name}{'Price'};
        my $qty = $cart_data->{$item_name}{'qty'};
        my $tax_amount = $cart_data->{$item_name}{'TaxAmount'};
        my $price_per_unit = $price/ $qty;
        my $tax_amount_per_unit = $tax_amount/ $qty;
        $object->{update_query}->execute($price+($price_per_unit*$quantity),$qty+$quantity,$tax_amount+($tax_amount_per_unit*$quantity), $item_name) or die $DBI::errstr;
        print "Quantity Updated in cart\n";
        $object->{update_query}->finish() if($object->{update_query});
    }
    else{
        print "Invalid Name Entered \n";
    }
}

sub totalCartAmount{
    my $object = shift;
    $object->{select_cart_query} = $object->{connection}->prepare('SELECT Price from cart_items');
    $object->{select_cart_query}->execute() or die $DBI::errstr;
    my $total_cart_price;
    while(my $row =$object->{select_cart_query}->fetchrow){
        $total_cart_price+= $row;
    }
    return print $total_cart_price,"\n";
}


sub totalCartTaxAmount{
    my $object = shift;
    $object->{select_cart_query} = $object->{connection}->prepare('SELECT TaxAmount from cart_items');
    $object->{select_cart_query}->execute() or die $DBI::errstr;
    my $total_cart_taxAmount;
    while(my $row =$object->{select_cart_query}->fetchrow){
        $total_cart_taxAmount+= $row;
    }
    return print $total_cart_taxAmount,"\n";
}

1;
