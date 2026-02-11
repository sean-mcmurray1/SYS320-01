.(Join-Path $PSScriptRoot ScrapingChamplainClasses.ps1)

clear

$fullTable = gatherClasses

$classTable = daysTranslator $fullTable




Write-Host ($classTable | Format-List | Out-String)

#i
#$classTable | Where-Object {$_."Instructor" -ilike "Furkan*"} | `
#           Select-Object "Class Code", Instructor, Location, Days, "Time Start", "Time End"

#ii
#$classTable | Where-Object { ($_.Location -ilike "FREE 105") -and ($_.Days -contains "Wednesday") } | `
#             Sort-Object "Time Start" -Descending | `
#            Select-Object "Time Start", "Time End", "Class Code"

#iii
#$ITSInstructors = $classTable | Where-Object {  ($_."Class Code" -ilike "SYS*") -or `
#                                                ($_."Class Code" -ilike "NET*") -or `
#                                                ($_."Class Code" -ilike "SEC*") -or `
#                                                ($_."Class Code" -ilike "FOR*") -or `
#                                                ($_."Class Code" -ilike "CSI*") -or `
#                                                ($_."Class Code" -ilike "DAT*") } `
#                              | Sort-Object "Instructor" `
#                              | Select-Object "Instructor" -Unique
#$ITSInstructors

#iv
#$classTable | Where { $_.Instructor -in $ITSInstructors.Instructor  } `
#            | Group-Object "Instructor" | Select-Object Count,Name | Sort-Object Count -Descending