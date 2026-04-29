#! /bin/bash

link="10.0.17.6/IOC.html"

fullPage=$(curl -sL "$link")

echo "$fullPage" |
xmlstarlet select --html --recover --nonet -t \
-m "//table//tr[position()>1]" \
-v "normalize-space((th|td)[1])" -n \
	> IOC.txt
