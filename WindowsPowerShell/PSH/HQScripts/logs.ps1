# logs
Invoke-Command -ComputerName  -ScriptBlock {gwmi} 
Get-eventlog –logname Application | where {$_.EntryType –eq “warning”} | select-object -first 10 

$applog = New-Object -typename System.Diagnostics.eventlog (“Application”, “ARIEL”) 
$applog.entries | where {$_.EntryType –eq "warning"} | select-object -first 10 | fl *
