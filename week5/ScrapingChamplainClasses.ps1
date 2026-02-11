function gatherClasses(){
$page = Invoke-WebRequest -TimeoutSec 2 http://10.0.17.47/Courses2026SP.html

$trs=$page.ParsedHtml.body.getElementsByTagName("tr")

$fullTable = @()
for($i=1; $i -lt $trs.length; $i++){
    
    $tds = $trs[$i].getElementsByTagName("td")

    $Times = $tds[5].innerText.split("-")

    $FullTable += [pscustomobject]@{"Class Code"  = $tds[0].innerText;
                                    "Title"       = $tds[1].innerText;
                                    "Days"        = $tds[4].innerText;
                                    "Time Start"  = $Times[0];
                                    "Time End"    = $Times[1];
                                    "Instructor"  = $tds[6].innerText;
                                    "Location"    = $tds[9].innerText;
                                }

}
return $fullTable
}
function daysTranslator($fullTable){
for ($i=0; $i -lt $fullTable.Length; $i++){
    $Days = @()

    if($fullTable[$i].Days -ilike "M*"){  $Days += "Monday" }

    if($fullTable[$i].Days -ilike "*T[TWF]*"){  $Days += "Tuesday" }
    ElseIf($fullTable[$i].Days -ilike "T"){  $Days += "Tuesday" }

    if($fullTable[$i].Days -ilike "*W*"){  $Days += "Wednesday" }

    if($fullTable[$i].Days -ilike "*TH*"){  $Days += "Thursday" }

    if($fullTable[$i].Days -ilike "*F*"){  $Days += "Friday" }

    $fullTable[$i].Days = $Days
}

return $fullTable
}
