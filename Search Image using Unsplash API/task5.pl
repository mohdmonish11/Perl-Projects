#!/usr/bin/perl -w
use lib "/home4/tqmohamm/public_html/cgi-bin";
use CGI;
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

my @returned_Img_links = $object->unsplashApi($keyword);

for my $image(@returned_Img_links){ 
    print "<h3><li><img src= '$image' alt='Search Image not Found' ></li></h3> <br>";
}
        
my  $html_print = <<'DOBBY';
</body>
</html>
DOBBY
print $html_print;



