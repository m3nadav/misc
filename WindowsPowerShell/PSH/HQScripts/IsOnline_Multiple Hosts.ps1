# Using PowerShell Background Jobs, you can find a large number of online systems within only a few seconds.
# This code pings an IP segment from 10.10.10.1 to 10.10.10.255 and returns only those IPs that respond

function Check-Online {
       param(
              $computername       )
 
       test-connection -count 1 -ComputerName $computername -TimeToLive 5 -asJob | 
       Wait-Job |       
       Receive-Job |       
       Where-Object { $_.StatusCode -eq 0 } |       
       Select-Object -ExpandProperty Address}
 
$ips = 1..255 | ForEach-Object { "10.0.0.$_" }

$online = Check-Online -computername $ips

$online

# You can also resolve Host Names of All available hosts
function Check-Online {
 param(
 $computername
 )
 
 test-connection -count 1 -ComputerName $computername -TimeToLive 5 -asJob | 
 Wait-Job |
 Receive-Job |
 Where-Object { $_.StatusCode -eq 0 } |
 Select-Object -ExpandProperty Address
}

$ips = 1..255 | ForEach-Object { "10.0.0.$_" }
$online = Check-Online -computername $ips
 
$online | 
Sort-Object | 
ForEach-Object {
 $ip = $_
 try { 
  [System.Net.Dns]::GetHostByAddress($ip)
 } 
 catch { 
  "cannot resolve $ip. Reason: $_" 
 }
}