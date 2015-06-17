#!/usr/bin/ruby -w
=begin
/***************************************************************************
*
*          FILE:  MechanizeGetLinks-2012_10_23_0-2.rb
*
*         USAGE:  	ruby MechanizeGetLinks-2012_10_23_0-2.rb \
			"http://www.google.com/search?num=100&hl=us&as_qdr=all&q=uni perl programming filetype:pdf&btnG=Search" \
			| grep -v "google"  | grep -o 'http://[^"]*' | awk -F"&sa=" '{print $1}'
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
*       CREATED:  Di 23. Okt 08:54:59 CEST 2012
*      REVISION:  ---
*  ***************************************************************************/
=end

require 'mechanize'
require 'uri'
require 'hpricot'


agent= Mechanize.new

begin
	page=agent.get(ARGV[0].strip)
	page.links.each do |test|
		if test.href.split("")[0]=='/'
			hz="#{ARGV[0]}#{test.href}"
			hz.each  do |s|
			    x = s.scan(/
				        https?:\/\/
					        \w+
					        (?: [.-]\w+ )*
					        (?:
					            \/\W
					            [0-9]{1,15}
					            \?
					            [\w=]
					        )?
						    /ix)

					    p x
			end
			#puts hz.scan(/(https?:\/\/([-\w\.]+)+(:\d+)?(\/([\w\/_\.]*(\?\S+)?)?)?)/)
			puts URI.extract(hz)
		else
			#puts test.href
		end
	end

end
