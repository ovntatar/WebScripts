#!/usr/bin/perl
#===============================================================================
#
#          FILE:  MojoUserAgentGoogleJson-2012_10_26_0.pl
#
#         USAGE:  perl MojoUserAgentGoogleJson-2012_10_26_0.pl <QUERY ARG>
#
#   DESCRIPTION:
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Ovidiu Tatar (Mn), ovn.tatar@gmail.com
#       COMPANY:  
#       VERSION:  MojoUserAgentGoogleJson-2012_10_26_0.pl
#       CREATED:  Fr 26. Okt 16:07:39 CEST 2012
#      REVISION:  ---
#===============================================================================
use warnings;
use strict;

use Modern::Perl;
use Mojo::UserAgent;
use Data::Dumper;
my $ua = Mojo::UserAgent->new;
my $query=$ARGV[0];
my $test=$ua->get("http://ajax.googleapis.com/ajax/services/search/web?v=1.0&q=$query&num100&start=59")->res->json->{responseData}->{results};
print  Dumper($test);

#say $ua->get("$ARGV[0]")->res->dom->find('a[href^=http]');

