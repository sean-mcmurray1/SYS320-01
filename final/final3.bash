#! /bin/bash

inputFile="report.txt"
outputFile="report.html"

echo '<!DOCTYPE html>' > "$outputFile"
echo '<html>' >> "$outputFile"
echo '<head>' >> "$outputFile"
echo '    <title>Access Logs with IOC Indicators</title>' >> "$outputFile"
echo '    <style> table, th, td { border: 1px solid black} </style>' >> "$outputFile"
echo '</head>' >> "$outputFile"
echo '<body>' >> "$outputFile"
echo '    <h2>Access logs with IOC indicators:</h2>' >> "$outputFile"
echo '    <table>' >> "$outputFile"
echo '        <tr>' >> "$outputFile"
echo '            <th>IP</th>' >> "$outputFile"
echo '            <th>Date/Time</th>' >> "$outputFile"
echo '            <th>Page Accessed</th>' >> "$outputFile"
echo '        </tr>' >> "$outputFile"

while read -r line; do
    ip=$(echo "$line" | cut -d' ' -f1)
    datetime=$(echo "$line" | cut -d' ' -f2)
    page=$(echo "$line" | cut -d' ' -f3-)

    echo "<tr><td>$ip</td><td>$datetime</td><td>$page</td></tr>" >> "$outputFile"
done < "$inputFile"

echo '    </table>' >> "$outputFile"
echo '</body>' >> "$outputFile"
echo '</html>' >> "$outputFile"
sudo cp "$outputFile" /var/www/html/report.html
