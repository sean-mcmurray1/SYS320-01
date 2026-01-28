function getLoginOuts($days){
$loginouts = Get-EventLog -LogName System -Source Microsoft-Windows-Winlogon -After (Get-Date).AddDays(-$days)

$loginoutsTable = @()
for($i=0;  $i -lt $loginouts.Count; $i++) {

$event = ""
if($loginouts[$i].InstanceId -eq 7001) {$event = "Logon"}
if($loginouts[$i].InstanceId -eq 7002) {$event = "Logoff"}

$user = (New-Object System.Security.Principal.SecurityIdentifier `
$loginouts[$i].ReplacementStrings[1]).Translate([System.Security.Principal.NTAccount]).value

$loginoutsTable += [pscustomobject]@{"Time" = $loginouts[$i].TimeGenerated;
                                       "Id" = $loginouts[$i].EventID;
                                    "Event" = $event;
                                     "User" = $user;
                                    }
}
return $loginoutsTable
}
function getPowerOnOff($days){
$shutdowns = Get-EventLog -LogName System -After(Get-Date).AddDays(-$days) | Where-Object{($_.EventID -eq "6006") -or ($_.EventID -eq "6005")}

$shutdownsTable = @()
for($i=0;  $i -lt $shutdowns.Count; $i++) {

$event = ""
if($shutdowns[$i].EventID -eq 6005) {$event = "Poweron"}
if($shutdowns[$i].EventID -eq 6006) {$event = "Shutdown"}

$user = "System"

$shutdownsTable += [pscustomobject]@{"Time" = $shutdowns[$i].TimeGenerated;
                                       "Id" = $shutdowns[$i].EventID;
                                    "Event" = $event;
                                     "User" = $user;
                                    }
}
return $shutdownsTable
}
