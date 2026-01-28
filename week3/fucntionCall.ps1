. (Join-Path $PSScriptRoot getLoginOutsShutdowns.ps1)

clear

#get Login and Logoffs from the last 15 days
$loginoutsTable = getLoginOuts 15
$loginoutsTable

$shutdownsTable = getPowerOnOff 1000
$shutdownsTable