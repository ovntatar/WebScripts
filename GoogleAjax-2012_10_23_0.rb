#!/usr/bin/ruby -w
=begin
/***************************************************************************
*
*          FILE:  GoogleAjax-2012_10_23_0.rb
*
*         USAGE:  ruby GoogleAjax-2012_10_23_0.rb
*
*   DESCRIPTION:
*
*       OPTIONS:  ---
*  REQUIREMENTS:  ---
*          BUGS:  ---
*         NOTES:  ---
*        AUTHOR:  Ovidiu Tatar (Mn), ovn.tatar@gmail.com
*       COMPANY:  
*       VERSION:  
*       CREATED:  Di 23. Okt 22:12:04 CEST 2012
*      REVISION:  ---
*  ***************************************************************************/
=end

require 'rubygems'
require 'googleajax'
puts GoogleAjax.referer = "google.com"
puts GoogleAjax::Search.web("test")
