#! /bin/bash

logfile="$1"
iocfile="$2"

grep -f "$iocfile" "$logfile" | \
while read -r line; do
	ip=$(echo "$line" | grep -oE '\b([0-9]{1,3}\.){3}[0-9]{1,3}\b' | head -1)
	datetime=$(echo "$line" | grep -oE '[0-9]{2}/[A-Za-z]{3}/[0-9]{4}:[0-9:]+')
	page=$(echo "$line" | sed -n 's/.*GET \([^ ]*\).*/\1/p')

	echo "$ip $datetime $page"
done > report.txt

cat report.txt
