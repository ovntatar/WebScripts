#!/usr/bin/perl
#===============================================================================
#
#          FILE:  URLComponents-2012_10_15_0.pl
#
#         USAGE:  ./URLComponents-2012_10_15_0.pl
#
#   DESCRIPTION:
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Ovidiu Tatar (Mn), ovn.tatar@gmail.com
#       COMPANY:
#       VERSION:  URLComponents-2012_10_15_0.pl
#       CREATED:  Mo 15. Okt 11:34:38 CEST 2012
#      REVISION:  ---
#===============================================================================

# http://jose@net.info:8080/test/index.cgi?id=2#resource
#In addition to the obvious scheme( ), userinfo( ), server( ), port( ), path( ),
#query( ), and fragment( ) methods, there are some useful but less-intuitive ones.

#scheme		=http
#userinfo	=josef
#server		=Host - net.info
#port		=8080
#path		=test/index.cgi
#query		=id=2
#fragment	=resource


#use warnings;
#use strict;

use URI;


@urls='http://jose@net.info:8080/test/index.cgi?id=2#resource';
foreach my $url (@urls) {
    $url = URI->new($url);
    if ('http' eq $url->scheme)
    {
        print "$url is an http url!\n";
    }
}

#guery form
my $url = URI->new('http://www.example.int/search?food=pie&action=like');
@params = $url->query_form( );
for ($i=0; $i < @params; $i++)
{
    print "$i {$params[$i]}\n";
}


#query keywords
my $url = URI->new('http://www.example.int/search?i+like+pie');
@words = $url->query_keywords( );
print $words[-1], "\n";


#replace URL Components
my $base = 'http://phee.phye.phoe.fm/englishmen/blood';
my $goal = 'http://phee.phye.phoe.fm/englishmen/tony.jpg';
print URI->new($goal)->rel($base), "\n";


# forms
my $url = URI->new( 'http://www.census.gov/cgi-bin/gazetteer');
my($city,$state,$zip) = ("Some City","Some State","Some Zip");
$url->query_form(
# All form pairs:
    'city' 	=> $city,
    'state' => $state,
    'zip'	=> $zip,
);
print $url, "\n";
# so we can see it


