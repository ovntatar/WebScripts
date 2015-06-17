#!/usr/bin/perl
#===============================================================================
#
#          FILE:  MojoUserAgentBodyHref-2012_10_21_0.pl
#
#         USAGE:  perl MojoUserAgentBodyHref-2012_10_21_0.pl test
#
#   DESCRIPTION:
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Ovidiu Tatar (Mn), ovn.tatar@gmail.com
#       COMPANY:
#       VERSION:  MojoUserAgentBodyHref-2012_10_21_0.pl
#       CREATED:  So 21. Okt 18:31:28 CEST 2012
#      REVISION:  ---
#===============================================================================
use warnings;
use strict;

use Modern::Perl;
use Mojo::UserAgent;
my $ua = Mojo::UserAgent->new;
say $ua->get("$ARGV[0]")->res->dom->find('a[href^=http]');

