#!/usr/bin/python
#===============================================================================
#
#          FILE:  SimpleScaping-2012_10_25_0-1.py
#
#         USAGE:  python SimpleScaping-2012_10_25_0-1.py
#
#   DESCRIPTION:
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Ovidiu Tatar (Mn), ovn.tatar@gmail.com
#       COMPANY:  
#       VERSION:  SimpleScaping-2012_10_25_0-1.py
#       CREATED:  Do 25. Okt 21:17:01 CEST 2012
#      REVISION:  ---
#===============================================================================

from urllib import urlopen
from HTMLParser import HTMLParser
class Scraper(HTMLParser):
	in_h4 = False
	in_link = False
	def handle_starttag(self, tag, attrs):
		attrs = dict(attrs)
		if tag == 'span':
			self.in_h4 = True
		if tag == 'a' and 'href' in attrs:
			self.in_link = True
			self.chunks = []
			self.url = attrs['href']
	def handle_data(self, data):
		if self.in_link:
			self.chunks.append(data)
	def handle_endtag(self, tag):
		if tag == 'span':
			self.in_h4 = False
		if tag == 'a':
			if self.in_h4 and self.in_link:
				print '%s (%s)' % (''.join(self.chunks), self.url)
			self.in_link = False

text = urlopen('http://web.de').read()
parser = Scraper()
parser.feed(text)
parser.close()

