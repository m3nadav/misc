function global:ProcID
{
#$proc =  Read-Host "Please enter the process name (e.g.explorer):"
param([string]$proc)
if ($proc -eq ""){
    Write-Host "Please supply process name, e.g. explorer" -ForegroundColor Red
    break
    }
gps | where {$_.ProcessName -eq $proc} | Select-Object -Property id | fl    
}

ProcID explorer