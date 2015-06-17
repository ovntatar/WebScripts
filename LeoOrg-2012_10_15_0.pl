#!/usr/bin/perl
#===============================================================================
#
#          FILE:  LeoOrg-2012_10_15_0.pl
#
#         USAGE:  perl LeoOrg-2012_10_15_0.pl <WORD>
#
#   DESCRIPTION:
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Ovidiu Tatar (Mn), ovn.tatar@gmail.com
#       COMPANY:
#       VERSION:  LeoOrg-2012_10_15_0.pl
#       CREATED:  Mo 15. Okt 16:07:25 CEST 2012
#      REVISION:  ---
#===============================================================================
use warnings;
use strict;

#-Language
#    Translation direction. Please note that dict.leo.org always translates either to or from german. The following values can be used:
#    de
#        Alias for de2en - german to english.
#    fr
#        Alias for de2fr - german to french.
#    es
#        Alias for de2es - german to espaniol.
#    en2de
#        english to german.
#    fr2de
#        french to german.
#    es2de
#        espaniol to german.
#



use WWW::Dict::Leo::Org;
use Data::Dumper;

my $leo = new WWW::Dict::Leo::Org(Language => "en2de");
my @matches = $leo->translate("$ARGV[0]");
print Dumper(\@matches);
