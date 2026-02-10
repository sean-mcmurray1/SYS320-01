function getApacheLogs(){
    $logs = Get-Content C:\xampp\apache\logs\access.log
    $tableRecords = @()
    for ($i=0; $i -lt $logs.Count; $i++){
        $log = $logs[$i] -split " ";
        if($log[0] -ilike "10.*"){
            $tableRecords += [pscustomobject]@{
            "IP" = $log[0]
            "Time" = $log[3].Trim('[')
            "Method" = $log[5].Trim('"')
            "Page" = $log[6]
            "Protocol" = $log[7].Trim('"')
            "Response" = $log[8].Trim('"')
            "Referer" = if ($log.Count -ge 11) { $log[10].Trim('"') } else { "-".Trim('"') }
            }
        }
    }

    return $tableRecords
}