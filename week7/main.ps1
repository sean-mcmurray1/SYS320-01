. "C:\Users\champuser\SYS320-01\week6\LUMM\Event-Logs.ps1"
. (Join-Path $PSScriptRoot "Configuration.ps1")
. (Join-Path $PSScriptRoot "Email.ps1")
. (Join-Path $PSScriptRoot "Scheduler.ps1")

$configuration = $config

$Failed = atRiskUsers $configuration.DaysBack

sendAlertEmail ($Failed | Format-Table -AutoSize | Out-String)

chooseTimeToRun($configuration.Time)