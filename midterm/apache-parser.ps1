function parseApacheLog(){
    $logs = Get-Content C:\Users\champuser\SYS320-01\midterm\access.log
    $tableRecords = @()

    for($i=0; $i -lt $logs.Count; $i++){
    $log = $logs[$i] -split " ";
        $tableRecords += [pscustomobject]@{
        "IP"       = $log[0]
        "Time"     = $log[3].Trim('[')
        "Method"   = $log[5].Trim('"')
        "Page"     = $log[6]
        "Protocol" = $log[7].Trim('"')
        "Response" = $log[8].Trim('"')
        "Referer"  = if ($log.Count -ge 11) { $log[10].Trim('"') } else { "-".Trim('"')}
        }
    }
    return $tableRecords
}

#$Table = parseApacheLog
#
#Write-Host ($Table | Format-Table | Out-String)