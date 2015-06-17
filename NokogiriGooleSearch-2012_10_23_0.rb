#!/usr/bin/ruby -w
=begin
/***************************************************************************
*
*          FILE:  NokogiriGooleSearch-2012_10_23_0.rb
*
*         USAGE:  ruby NokogiriGooleSearch-2012_10_23_0.rb
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
*       CREATED:  Di 23. Okt 20:41:27 CEST 2012
*      REVISION:  ---
*  ***************************************************************************/
=end

require 'nokogiri'
require 'open-uri'

  # Get a Nokogiri::HTML:Document for the page we’re interested in...

doc = Nokogiri::HTML(open('http://www.google.com/search?q=tenderlove'))
  # Do funky things with it using Nokogiri::XML::Node methods...

  ####
  # Search for nodes by css
doc.css('h3.r a.l').each do |link|
    puts link.content
  end

  ####
  # Search for nodes by xpath
doc.xpath('//h3/a[@class="l"]').each do |link|
    puts link.content
end

  ####
  # Or mix and match.
doc.search('a').each do |link|
    puts link.content
	puts link
end
