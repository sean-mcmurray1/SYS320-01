#! /bin/bash

link="http://10.0.17.6/Assignment.html"

fullPage=$(curl -sL "$link")

echo "$fullPage" |
xmlstarlet select --html --recover --nonet -t \
-m "//table[@id='temp']/tr | //table[@id='press']/tr" \
-m "th|td" -v "normalize-space(.)" -o ";" \
-b -n \
| sed 's/;$//' \
      > tables.txt
