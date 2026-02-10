.(Join-Path $PSScriptRoot getApacheLogs.ps1)

clear

$tableRecords = getApacheLogs

Write-Host ($tableRecords | Format-Table -AutoSize | Out-String)

Write-Host ($tableRecords | Where-Object {
                                          $_.Page -like "/page2*" -and
                                          $_.Referer -like "*index*"
                                          }`
                                          |Format-Table | Out-String)