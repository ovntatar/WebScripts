#!/usr/bin/python
#===============================================================================
#
#          FILE:  BeautifulSoup-2012_10_25_0.py
#
#         USAGE:  python BeautifulSoup-2012_10_25_0.py
#
#   DESCRIPTION:
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Ovidiu Tatar (Mn), ovn.tatar@gmail.com
#       COMPANY:  
#       VERSION:  BeautifulSoup-2012_10_25_0.py
#       CREATED:  Do 25. Okt 21:22:14 CEST 2012
#      REVISION:  ---
#===============================================================================

from urllib import urlopen
from BeautifulSoup import BeautifulSoup
text = urlopen('http://web.de').read()
soup = BeautifulSoup(text)
jobs = set()
for header in soup('li'):
	links = header('a')
	if not links: continue
	link = links[0]
	jobs.add('%s (%s)' % (link.string, link['href']))
print '\n'.join(sorted(jobs, key=lambda s: s.lower()))

