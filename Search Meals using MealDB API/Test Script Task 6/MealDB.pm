#!/usr/bin/perl use 5.010;
package MealDB;
use Data::Dumper;
use Moose;
use LWP::UserAgent;
use HTTP::Request();
use JSON;

sub new{
    my $class= shift;
    my $self = {};
    return bless $self,$class;
}


sub creatingConnectionsWithAPI{
    my $url = $_[0];
    my $userAgent = new LWP::UserAgent;
    my $header =['Content-Type' =>'application/json; charset=UTF-8'];
    my $request = new HTTP::Request('GET',$url, $header);
    my $response = $userAgent->request($request);
    my $return_data;
    if( $response->is_success ) {
        $return_data = {
            data   => decode_json( $response->{'_content'} ),
        }
    } 
    return $return_data;
}


sub FetchMenuByName{
    my $object = shift;
    my $input_recipe = $_[0];
    my $url;
    my @recipe_list;
    if (length($input_recipe) > 1){
        $url = "https://www.themealdb.com/api/json/v1/1/search.php?s=".$input_recipe;        
    }
    else{
        $url = "https://www.themealdb.com/api/json/v1/1/search.php?f=".$input_recipe;
    }
    my $fetch_data = creatingConnectionsWithAPI($url);
    for my $data(@{$fetch_data->{data}->{'meals'}}){
        push (@recipe_list, $data->{'strMeal'});
    }
    return ($fetch_data,\@recipe_list);
}

sub IngredientsForSelectedRecipe{
    my $object = shift;
    my @ingredient;
    my ($input_spcl_recipe_name, $fetch_data) = @_;
    for my $data(@{$fetch_data->{data}{'meals'}}){
        for my $ingredient(keys %$data){
            if (($data->{'strMeal'}) eq $input_spcl_recipe_name){
                push @ingredient, $data->{$ingredient} if ($ingredient =~/^strIngredient/ and $data->{$ingredient});
            }
        }
    }   
    return \@ingredient;
}

sub FetchByCategoryAreaIngredients{
    my $object = shift;
    my $input_recived = $_[0];
    my $url;
    my @recipe_list;

    $url = "https://www.themealdb.com/api/json/v1/1/list.php?";
    my $url_append = (lc($input_recived) eq 'c') ? "c=list": (lc($input_recived) eq 'a')? "a=list": "i=list";
    $url .= $url_append;

    my $fetch_data = creatingConnectionsWithAPI($url);
    if (lc($input_recived) eq 'c'){
        for my $data(@{$fetch_data->{data}{'meals'}}){
            push (@recipe_list, $data->{'strCategory'});
        }
    }
    elsif(lc($input_recived) eq 'a'){
        for my $data(@{$fetch_data->{data}{'meals'}}){
            push (@recipe_list, $data->{'strArea'});
        }
    }
    elsif(lc($input_recived) eq 'i'){
        for my $data(@{$fetch_data->{data}{'meals'}}){
            push (@recipe_list, $data->{'strIngredient'});
        }
    }
    return \@recipe_list;
}


sub FilterByMainIngredientCategoryArea{
    my $object = shift;
    my ($input_recived, $filter_word) = @_;
    my $url;
    my @recipe_list;

    $url = "https://www.themealdb.com/api/json/v1/1/filter.php?";
    my $url_append = (lc($input_recived) eq 'i') ? "i=$filter_word": (lc($input_recived) eq 'c')? "c=$filter_word": "a=$filter_word";
    $url .= $url_append;
    
    my $fetch_data = creatingConnectionsWithAPI($url);
    for my $data(@{$fetch_data->{data}{'meals'}}){
        push (@recipe_list, $data->{'strMeal'});
    }
    return \@recipe_list;
}
1;