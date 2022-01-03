#!/usr/bin/perl use 5.010;
use Moose;
use Data::Dumper;
use lib"C:/Users/MOHD MONISH/Desktop/Task/PERL/Task6";  
use MealDB;

my $object = new MealDB();   #creating an object 

while(1){
    print"Press 1 List Menu by name or first letter\n";
    print"Press 2 List ingredients for the  selected recipe\n";
    print"Press 3 List Menu by Categories, Area, Ingredients\n";
    print"Press 4 Filter by Main Ingredient Category Area\n";
    print"Press 0 to exit\nChoose Wisely: ";
    my $input=<STDIN>;
    if ($input == 1){
        print"Enter the name or first letter of the recipe you wanna Fetch/Search:  ";
        chomp (my $input_recipe = <STDIN>);
        my ($fetch_data, $recipe) = $object->FetchMenuByName($input_recipe);
        my @recipe_list = @$recipe;  
        validateCheck(@recipe_list);

    }
    elsif($input == 2){
        print"Enter the name of recipe or first letter to get the menu:  ";
        chomp (my $input_recipe = <STDIN>);
        my ($fetch_data, @recipe_list) = $object->FetchMenuByName($input_recipe);
        validateCheck(@recipe_list);
        print"From above Menu pick special recipe to get the ingredients: ";
        chomp(my $input_spcl_recipe_name = <STDIN>);
        my $data = $object->IngredientsForSelectedRecipe($input_spcl_recipe_name,$fetch_data);
        # my $length = @{$data}; 
        # print $length,"\n";
        # print Dumper $data;
        my @recipe = @$data;  
        validateCheck(@recipe);
    }
    elsif($input == 3){
        print"Type C/c for Category, Type A/a for Area, Type I/i for Ingredients Search: ";
        chomp(my $input_passed = <STDIN>);
        my $data = $object->FetchByCategoryAreaIngredients($input_passed);
        my $length = @{$data}; 
        print $length,"\n";
        print Dumper $data;
        my @category_name  = @$data;
        # validateCheck(@category_name);
    }
    elsif($input == 4){
        print"Press I/i for Filter by Main Ingredients\n";
        print"Press C/c for Filter by Category\nPress A/a for Filter by Area\n";
        print"Choose Wisely: ";
        my $filter_word;
        chomp(my $input_passed = <STDIN>);
        if (lc($input_passed) eq 'i'){
            print"Please Enter the Main Ingredient name on which you wanna Filter the data: ";
            chomp($filter_word=<STDIN>);
        }
        elsif(lc($input_passed) eq 'c'){
            print"Please Enter the Category name on which you wanna Filter the data: ";
            chomp($filter_word=<STDIN>);
        }
        elsif(lc($input_passed) eq 'a'){
            print"Please Enter the Area name on which you wanna Filter the data: ";
            chomp($filter_word=<STDIN>);
        }
        my $data = $object->FilterByMainIngredientCategoryArea($input_passed, $filter_word);
        print Dumper $data;
        my @menu_items = @$data;
        # validateCheck(@menu_items);   
    }
    last if ($input == 0);
}

sub validateCheck{
    my @recipe_list= @_;
    if (@recipe_list){
        print Dumper(@recipe_list);
    }
    else{
        print "NO Data Found Enter Relevant Search Words \n";
    }
}
