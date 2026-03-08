. (Join-Path $PSScriptRoot "table.ps1")
. (Join-Path $PSScriptRoot "apache-parser.ps1")
$patterns = getPattern
$logs = parseApacheLog

function checkLogsForPatterns($patterns, $logs){
$appendedLog = @()
    for($i = 0; $i -lt $logs.Count; $i++){
        $log = $logs[$i]
        for ($j = 0; $j -lt $patterns.Count; $j++){
            $p = $patterns[$j]

            if ($log.page -like "*$($p.pattern)*"){
                $appendedLog += $log
                break
            }
        }
    }
    return $appendedLog
}

$Table = checkLogsForPatterns $patterns $logs

Write-Host ($Table | Format-Table | Out-String)
