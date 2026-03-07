clear
$configurationPath = Join-Path $PSScriptRoot 'configuration.txt'
$lines = Get-Content $configurationPath

$config = [pscustomobject]@{
    DaysBack = [int]$lines[0].Trim()
    Time     = $lines[1].Trim()
}
function changeConfig{
    $Prompt = "`n"
    $Prompt += "Please choose your operation:`n"
    $Prompt += "1 - Show Configuration`n"
    $Prompt += "2 - Change Configuration`n"
    $Prompt += "3 - Exit`n"

    $operation = $true

    while($operation){
        Write-Host $Prompt | Out-String
        $choice = Read-Host 

        if($choice -eq 3){
            Write-Host "Goodbye" | Out-String
            exit
            $operation = false
        }
        elseif($choice -eq 1){
            $config | Format-Table -Autosize
        }
        elseif($choice -eq 2){
            $daysBackUpdate = Read-Host "Enter number of days to evaluate: "
            $daysBackUpdate = $daysBackUpdate.Trim()
            $timeUpdate = Read-Host "Enter execution time (h:mm AM/PM example (1:20 PM)): "
            $timeUpdate = $timeUpdate.Trim().ToUpper()

            if ($daysBackUpdate -notmatch '^\d+$') {
            Write-Host "INVALID DAYS, must be digits"
            continue
            }

            if ($timeUpdate -notmatch '\d:\d{2}\s(AM|PM)$') {
            Write-Host "INVALID TIME, must be input in format h:mm AM/PM: example (1:20 PM)"
            continue
            }

            $config.DaysBack = [int]$daysBackUpdate
            $config.Time = $timeUpdate

            Set-Content -Path $configurationPath -Value @($daysBackUpdate, $timeUpdate)
        }
        else {
            Write-Host "Invalid selection. Please enter an integer 1-3."
        }
    }
}