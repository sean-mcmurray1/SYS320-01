#!bin/bash

file="/var/log/apache2/access.log"

function getAllLogs(){
	cut -d' ' -f7 "$file"
}

function pageCount(){
	getAllLogs | sort | uniq -c
}

pageCount

