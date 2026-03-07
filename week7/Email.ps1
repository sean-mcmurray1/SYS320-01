function SendAlertEmail($Body){

$From = "sean.mcmurray@mymail.champlain.edu"
$To = "sean.mcmurray@mymail.champlain.edu"
$Subject = "Suspicous Activity"

$Password = Get-Content "C:\Users\champuser\SYS320-01\week7\file.txt" | ConvertTo-SecureString
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $From, $Password


Send-MailMessage -From $From -To $To -Subject $Subject -Body $Body -SmtpServer "smtp.gmail.com" `
-Port 587 -UseSsl -Credential $Credential

}

SendAlertEmail "Body of Email"