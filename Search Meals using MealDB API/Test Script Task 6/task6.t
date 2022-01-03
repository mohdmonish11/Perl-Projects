#!/usr/bin/perl use 5.010;
use strict;
use warnings;
use Test::More;
use Data::Dumper;
use Test::Deep;
use lib"C:/Users/MOHD MONISH/Desktop/Task/PERL/Task6";

BEGIN {
    use_ok("MealDB") or die "Unable to open $! ($@)"
};

subtest "MEALDB-> LIST MENU BY NAME/FIRST LETTER ->MODULE(FetchMenuByName)" => sub{
    my $expected_output =[
          'Chicken Handi','Chicken Congee','Chicken Karaage','Chicken Marengo',
          'Tandoori chicken','Chicken Couscous','Kung Pao Chicken',
          'Chicken Basquaise','Chicken Parmentier','Brown Stew Chicken',
          'Katsu Chicken curry','Nutty Chicken Curry','General Tso\'s Chicken',
          'Kentucky Fried Chicken','Chicken Ham and Leek Pie','Chicken Alfredo Primavera',
          'Chicken & mushroom Hotpot', 'Teriyaki Chicken Casserole', 'Potato Gratin with Chicken',
          'Chicken Quinoa Greek Salad','Piri-piri chicken and slaw',
          'Chicken Enchilada Casserole','Chicken Fajita Mac and Cheese',
          'Crock Pot Chicken Baked Tacos','Jerk chicken with rice & peas'
        ];
    my $item_name = "chicken";
    my $obj = new MealDB();
    my ($fetch_data, $recipe) = $obj->FetchMenuByName($item_name);
    is_deeply($recipe, $expected_output, "TEST IS OKAY");
};

subtest "FETCH INGREDIENT FOR RECIPE/ IngredientsForSelectedRecipe"=> sub{

    my $recipe_name = "Chicken Handi";
    my $obj = new MealDB();
    my ($fetch_data, $recipe) = $obj->FetchMenuByName("c");
    my $test_output = $obj->IngredientsForSelectedRecipe($recipe_name, $fetch_data);
    my $length = @{$test_output};
    my $expected_output = 1 if (16 == $length);
    ok(1 == $expected_output, "TEST IS OKAY") or diag explain $test_output;
};

subtest "CATEGORIES OF FOOD/ FetchByCategoryAreaIngredients"=> sub{
    my $expected_output = [
          'Beef','Breakfast','Chicken','Dessert','Goat','Lamb',
          'Miscellaneous','Pasta','Pork','Seafood','Side','Starter','Vegan','Vegetarian'
        ];

    my $category = "C";
    my $obj = new MealDB();
    my $test_output = $obj->FetchByCategoryAreaIngredients($category);
    is_deeply($test_output, $expected_output, "TEST IS OKAY");
};

subtest "AREA or Location / FetchByCategoryAreaIngredients"=> sub{
    my $expected_output = [
        'American','British','Canadian','Chinese','Croatian','Dutch','Egyptian','French', 'Greek',
        'Indian','Irish','Italian','Jamaican','Japanese','Kenyan','Malaysian','Mexican',
        'Moroccan','Polish','Portuguese','Russian','Spanish','Thai','Tunisian','Turkish',
        'Unknown','Vietnamese'
        ];

    my $area = "A";
    my $obj = new MealDB();
    my $test_output = $obj->FetchByCategoryAreaIngredients($area);
    is_deeply($test_output, $expected_output, "TEST IS OKAY");
};

subtest "INGREDIENT USED IN RECIPE/ FetchByCategoryAreaIngredients"=> sub{
    my $ingredient = "I";
    my $obj = new MealDB();
    my $test_output = $obj->FetchByCategoryAreaIngredients($ingredient);
    my $length = @{$test_output};
    my $expected_output = 1 if (574 == $length);
    ok(1 == $expected_output, "TEST IS OKAY") or diag explain $test_output;
};

subtest "FILTER RECIPES BY MAIN INGREDIENT / FetchByCategoryAreaIngredients"=> sub{
    my $expected_output = [
          'Brown Stew Chicken',
          'Chicken & mushroom Hotpot',
          'Chicken Alfredo Primavera',
          'Chicken Basquaise',
          'Chicken Congee',
          'Chicken Handi',
          'Kentucky Fried Chicken',
          'Kung Pao Chicken',
          'Pad See Ew',
          'Piri-piri chicken and slaw',
          'Thai Green Curry'
        ];
    my $main_ingredient = "chicken";
    my $obj = new MealDB();
    my $test_output = $obj->FilterByMainIngredientCategoryArea("i",$main_ingredient);
    is_deeply($test_output, $expected_output, "TEST IS OKAY");
};

subtest "FILTER RECIPES BY CATEGORY / FetchByCategoryAreaIngredients"=> sub{
    my $expected_output = [
          'Roast fennel and aubergine paella',
          'Vegan Chocolate Cake',
          'Vegan Lasagna'
        ];

    my $category = "Vegan";
    my $obj = new MealDB();
    my $test_output = $obj->FilterByMainIngredientCategoryArea("c",$category);
    is_deeply($test_output, $expected_output, "TEST IS OKAY");
};

subtest "FILTER RECIPES BY AREA / FetchByCategoryAreaIngredients"=> sub{
    my $expected_output = [
          'Massaman Beef curry',
          'Pad See Ew',
          'Thai Green Curry'
        ];
    my $area = "Thai";
    my $obj = new MealDB();
    my $test_output = $obj->FilterByMainIngredientCategoryArea("a",$area);
    is_deeply($test_output, $expected_output, "TEST IS OKAY");
};

done_testing();