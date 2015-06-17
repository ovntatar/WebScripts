#!/usr/bin/perl
#===============================================================================
#
#          FILE:  MojoUserAgentSearchCpan-2012_10_21_0.pl
#
#         USAGE:  perl MojoUserAgentSearchCpan-2012_10_21_0.pl mechanize 
#
#   DESCRIPTION:
#
#       OPTIONS:  for deb use MOJO_USERAGENT_DEBUG=1 perl MojoUserAgentSearchCpan-2012_10_21_0.pl mojo
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Ovidiu Tatar (Mn), ovn.tatar@gmail.com
#       COMPANY:
#       VERSION:  MojoUserAgentSearchCpan-2012_10_21_0.pl
#       CREATED:  So 21. Okt 18:47:27 CEST 2012
#      REVISION:  ---
#===============================================================================
use warnings;
use strict;

use Modern::Perl;
use Mojo::UserAgent;
use Data::Dumper;

my $ua = Mojo::UserAgent->new;

my $tx = $ua->post_form('search.cpan.org/search' => { query => "$ARGV[0]"});
#print Dumper($tx);
if ($tx->success) {
    say $tx->res->dom->find('.sr a b');
#	say $tx->res->body;
} else {
    say $tx->res->error;
}






