$machine1 = Get-Service –ComputerName server1-or-IP1
$machine2 = Get-Service –ComputerName server2-or-IP2
Compare-Object $machine1 $machine2 –Property Name,Status –passThru | Sort-Object Name | Select-Object Name, Status, MachineName