#!/usr/bin/perl use 5.010;
# use Moose;
use strict;
use warnings;

# ROMAN NUMBER TO DECIMAL NUMBER CONVERTOR
##################### ROMAN NUMBER:::::::::::::::DECIMAL NUMBER######################

sub romanToDecimalConvertor{
    chomp(my $romanInput = shift);
    my $converted_value =0;
    my $value;
    for ($romanInput){
        $value =$_;
        $value =~s/IV/IIII/;  
        $value =~s/IX/VIIII/;           
        $value =~s/IL/XLVIIII/;         
        $value =~s/XL/XXXX/;             
        $value =~s/IC/LXXXXVIIII/;      
        $value =~s/XC/LXXXX/;           
        $value =~s/ID/XDVIIII/;         
        $value =~s/XD/CDLXXXX/;         
        $value =~s/CD/CCCC/;            
        $value =~s/IM/CMLXXXXVIIII/;    
        $value =~s/XM/CMLXXXX/;         
        $value =~s/CM/DCCCC/; 
    }
    #print "$value\n";
    #return print $value;
    for (split //,$value){
        # print $_,"\n";
        if ($_ =~ 'I'or $_ =~'V'or $_ =~'X'or $_ =~'L'or $_ =~'C'or $_ =~'D'or $_ =~'M'){
            # print $_,"\n"; 
            $converted_value+=1 if ($_ =~ 'I');
                
            $converted_value+=5 if ($_ =~ 'V');
                
            $converted_value+=10 if ($_ =~ 'X');
                
            $converted_value+=50 if ($_ =~ 'L');
                
            $converted_value+=100 if ($_ =~ 'C');
            
            $converted_value+=500 if ($_ =~ 'D');
                
            $converted_value+=1000 if ($_ =~ 'M');  
        }
        else{
            return "Invalid Input";
        }
    }
    return $converted_value;
    
}

# print"Enter the number to convert: ";
# my $input_value =<STDIN>;
# print "The converted value is: ", romanToDecimalConvertor($input_value),"\n";
1;