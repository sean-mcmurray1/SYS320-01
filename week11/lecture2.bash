#!bin/bash
file="/var/log/apache2/access.log"

function countingCurlAccess() {
	cut -d' ' -f1,12 "$file" | grep 'curl/' | sort | uniq -c
}

countingCurlAccess

