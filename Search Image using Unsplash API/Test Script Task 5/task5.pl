#!/usr/bin/perl -w
# use lib "/home4/tqmohamm/public_html/cgi-bin";
use lib "C:/Users/MOHD MONISH/Desktop/Task/PERL/Task5/Final CGI View";
use CGI;
use Data::Dumper;
use Unsplash;

my $cgi = CGI->new();
print $cgi->header;
my $input_images = <<'START';
<html>
  <head>
    <title>Image Searching</title>
  </head>
  <body>
    <form action="/cgi-bin/task5.pl" method="get">
        Please Enter the Keyword:  <input type="text" name="image"><br>
        <input type="submit">
    </form>
START
print $input_images;

my $keyword = $cgi->param('image');

my $object = new Unsplash();
# print"ENTER THE NAME TO SEARCH: ";
# chomp(my $keyword =<STDIN>);

my @returned_Img_links = $object->unsplashApi($keyword);

for my $image(@returned_Img_links){ 
    print "<h3><li><img src= '$image' alt='Search Image not Found' ></li></h3> <br>";
}
        
my  $html_print = <<'DOBBY';
</body>
</html>
DOBBY
print $html_print;



