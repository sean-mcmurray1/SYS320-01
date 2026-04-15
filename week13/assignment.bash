#! /bin/bash
clear

bash tables.bash

tableFile="tables.txt"

function displayJoinedTable(){

echo "Temp | Press | Date-Time"

temps=$(grep -E '^[0-9]+;' tables.txt | head -5 | cut -d';' -f1)
pressures=$(grep -E '^[0-9]+;' tables.txt | tail -5 | cut -d';' -f1)
dates=$(grep -E '^[0-9]+;' tables.txt | head -5 |  cut -d';' -f2)

for i in {0..4}; do
	temp=$(echo "$temps" | sed -n "$((i+1))p")
	pressure=$(echo "$pressures" | sed -n "$((i+1))p")
	date=$(echo "$dates" | sed -n "$((i+1))p")

	echo "$temp    $pressure      $date"
done
}

displayJoinedTable
