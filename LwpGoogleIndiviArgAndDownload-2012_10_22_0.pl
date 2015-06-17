#!/usr/bin/perl
#===============================================================================
#
#          FILE:  LwpGoogleIndiviArgAndDownload-2012_10_22_0.pl
#
#         USAGE:  perl LwpGoogleIndiviArgAndDownload-2012_10_22_0.pl 100 mechanize pl 
#
#   DESCRIPTION:
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Ovidiu Tatar (Mn), ovn.tatar@gmail.com
#       COMPANY:  
#       VERSION:  LwpGoogleIndiviArgAndDownload-2012_10_22_0.pl
#       CREATED:  Mo 22. Okt 22:19:31 CEST 2012
#      REVISION:  ---
#===============================================================================
use warnings;
use strict;

use LWP;
use URI;
use Data::Dumper;
use LWP::Simple ;

my $browser = LWP::UserAgent->new;
$browser->agent("Mozilla/5.0");
my $url = URI->new('http://www.google.com/search');

$url->query_form(
    'h1'    => 'en',
    'num'   => "$ARGV[0]",
    'start' => "$ARGV[0]",
    'q'     => "$ARGV[1] filetype:$ARGV[2]",
);

my $res = $browser->get($url);

#print Dumper($res), "\n";

my $html = $res->content;
while ( $html =~ m/<a href=\"(.*?)\"/g ) {
    my $line = URI->new_abs( $1, $res->base );
    my @values = split( 'q=', $line );
    if ( $values[1] ) {
        $_ = $values[1];
        if (m#^http://([^/]+)(.*)#) {
            my @v = split( '&', $2 );
            my $DR = "http://$1$v[0]";
            my $last_field = ( split '/', $v[0] )[-1];
            my $file = "tmp/$last_field ";
            print $DR, "\n";
            getstore( "$DR", "$file" );
        }
    }
}


