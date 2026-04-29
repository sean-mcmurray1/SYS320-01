#! /bin/bash

logfile="/home/champuser/SYS320-01/week15/fileaccesslog.txt"

echo "File was accessed $(date '+%a %b %d %I:%M:%S %P %Z %Y')" >> "$logfile"

function getFileAccessed(){
logline=$(cat "$logfile")
fileAccessDates=$(echo "$logline" | cut -d' ' -f4,5,6,7,8 | tr ':' '-')
echo "$fileAccessDates"
}


echo "To: sean.mcmurray@mymail.champlain.edu" > emailform.txt
echo "Subject: userlogs accessed" >> emailform.txt
getFileAccessed >> emailform.txt
cat emailform.txt | ssmtp sean.mcmurray@mymail.champlain.edu
