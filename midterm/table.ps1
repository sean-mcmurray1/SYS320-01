function getPattern(){
$page = Invoke-WebRequest -TimeoutSec 5 http://10.0.17.6/IOC.html

$trs = $page.ParsedHtml.body.getElementsByTagName("tr")

$patternTable = @()
for($i=1; $i -lt $trs.length; $i++){
    
    $tds = $trs[$i].getElementsByTagName("td")
    
    $patternTable += [pscustomobject]@{"Pattern"      = $tds[0].innerText;
                                       "Description"  = $tds[1].innerText;
                                    }

    }
return $patternTable
}

#$Table = getPattern
#
#Write-Host ($Table | Format-Table | Out-String)