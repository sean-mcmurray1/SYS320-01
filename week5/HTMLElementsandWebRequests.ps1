$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.47/ToBeScraped.html

#$scraped_page.Links | select outerText, href

#$h2s=$scraped_page.ParsedHtml.body.getElementsByTagName("h2") | select outerText

#$h2s

$divs1=$scraped_page.ParsedHtml.body.getElementsByTagName("div") | where {
$_.getAttributeNode("class").Value -ilike "*div-1*"} | select innerText

$divs1





