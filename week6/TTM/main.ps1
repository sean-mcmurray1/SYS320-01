. (Join-Path $PSScriptRoot "..\LUMM\Event-Logs.ps1")
. (Join-Path $PSScriptRoot "..\..\week4\getApacheLogs.ps1")
. (Join-Path $PSScriptRoot "..\..\week2\processManagement.ps1")

clear

$Prompt = "`n"
$Prompt += "Please choose your operation:`n"
$Prompt += "1 - Display last 10 apache logs`n"
$Prompt += "2 - Display last 10 failed logins for all users`n"
$Prompt += "3 - Display at risk users`n"
$Prompt += "4 - Start Chrome and navigate to Champlain.edu`n"
$Prompt += "5 - Exit`n"



$operation = $true

while($operation){

    
    Write-Host $Prompt | Out-String
    $choice = Read-Host 

    if($choice -eq 5){
        Write-Host "Goodbye" | Out-String
        exit
        $operation = $false 
    }
    elseif($choice -eq 1){
        
        $tableRecords = getApacheLogs

        Write-Host ($tableRecords | Sort-Object Time -Descending | Select-Object -First 10 |
        Format-Table -AutoSize | Out-String)

    }
    elseif($choice -eq 2){
        Write-Host (getFailedLogins 1000 | Sort-Object Time -Descending | Select-Object -First 10 |
        Format-Table Time, User, ID -AutoSize | Out-String)
    }
    elseif($choice -eq 3){
        atRiskUsers 30
    }
    elseif($choice -eq 4){
        startChromeChamplain
    }
    else {
        Write-Host "Invalid selection. Please enter an integer 1-5."
    }

}