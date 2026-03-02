function startChromeChamplain{
$browser = Get-Process -Name chrome -ErrorAction SilentlyContinue

if ($browser){
    Stop-Process -Name chrome
}
Start-Process chrome.exe "https://champlain.edu"
}
#startChromeChamplain