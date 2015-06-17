#!/usr/bin/perl
#===============================================================================
#
#          FILE:  MojoUserAgentTestUrl-2012_10_21_0.pl
#
#         USAGE:  perl MojoUserAgentTestUrl-2012_10_21_0.pl
#
#   DESCRIPTION:
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Ovidiu Tatar (Mn), ovn.tatar@gmail.com
#       COMPANY:
#       VERSION:  MojoUserAgentTestUrl-2012_10_21_0.pl
#       CREATED:  So 21. Okt 20:52:06 CEST 2012
#      REVISION:  ---
#===============================================================================
use warnings;
use strict;

use Mojo::URL;
my $url = Mojo::URL->new('https://mail.google.com/mail/?tab=wm#inbox/13c2adfff22cd');

print $url->path . "\n";
print $url->scheme ."\n";
print  $url->host ."\n";
