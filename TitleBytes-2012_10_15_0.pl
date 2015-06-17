#!/usr/bin/perl
#===============================================================================
#
#          FILE:  TitleBytes-2012_10_15_0.pl
#
#         USAGE:  ./TitleBytes-2012_10_15_0.pl
#
#   DESCRIPTION:
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Ovidiu Tatar (Mn), ovn.tatar@gmail.com
#       COMPANY:
#       VERSION:  TitleBytes-2012_10_15_0.pl
#       CREATED:  Mo 15. Okt 10:14:21 CEST 2012
#      REVISION:  ---
#===============================================================================
use warnings;
use strict;

use LWP::UserAgent;
use HTTP::Request;
use HTTP::Response;
use URI::Heuristic;
my $raw_url = shift or die "usage: $0 url\n";
my $url = URI::Heuristic::uf_urlstr($raw_url);
$| = 1;

# to flush next line
printf "%s =>\n\t", $url;
my $ua = LWP::UserAgent->new();
$ua->agent("Schmozilla/v9.14 Platinum");

# give it time, it'll get there
my $req = HTTP::Request->new( GET => $url );

#$req->referer("http://wizard.yellowbrick.oz");
# perplex the log analysers
my $response = $ua->request($req);
if ( $response->is_error() ) {
    printf "%s\n", $response->status_line;
}
else {
    my $count;
    my $bytes;
    my $content = $response->content();
    $bytes = length $content;
    $count = ( $content =~ tr/\n/\n/ );
    printf "%s (%d lines, %d bytes)\n", $response->title(), $count, $bytes;
}
