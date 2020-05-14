# find out which user is locally logged on a machine, anywhere:
$computername = "localhost"
Get-WmiObject Win32_ComputerSystem -ComputerName $computername | Select-Object -ExpandProperty UserName