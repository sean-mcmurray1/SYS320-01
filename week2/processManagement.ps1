$browser = Get-Process -Name chrome

if ($browser){
    Stop-Process -Name chrome
}
else {
    Start-Process "chrome.exe" "https://champlain.edu"
}
