#!/usr/bin/perl
#===============================================================================
#
#          FILE:  LwlGoogle-2012_10_21_0.pl
#
#         USAGE:  perl LwlGoogle-2012_10_21_0.pl <WORD>
#
#   DESCRIPTION:  Use Google engine of the commad line 
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Ovidiu Tatar (Mn), ovn.tatar@gmail.com
#       COMPANY:
#       VERSION:  LwlGoogle-2012_10_21_0.pl
#       CREATED:  So 21. Okt 19:43:13 CEST 2012
#      REVISION:  ---
#===============================================================================
use warnings;
use strict;

use LWP;
use URI;
use Data::Dumper;

my $browser = LWP::UserAgent->new;
$browser->agent("Mozilla/5.0");
my $url = URI->new('http://www.google.com/search');

$url->query_form(
    'h1'    => 'en',
    'num'   => '100',
    'start' => '100',
    'q'     => "$ARGV[0]"
);

my $res = $browser->get($url);

#print Dumper($res), "\n";

my $html = $res->content;

#print Dumper($html), "\n";
while ( $html =~ m/<a href=\"(.*?)\"/g ) {
    my $line = URI->new_abs( $1, $res->base );
    $line =~ s/^http*.*q=//;
    $line =~ s/\.pdf*.*/\.pdf/;
    if ( $line !~ /google|filetype:pdf/ ) {
        $line =~ s/cache:*.*:http/http/;
        $line =~ s/related://;
        print $line , "\n";
    }
}


