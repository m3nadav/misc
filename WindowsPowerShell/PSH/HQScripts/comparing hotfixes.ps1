$machine1 = Get-HotFix -ComputerName server1
$machine2 = Get-HotFix -ComputerName pc-or-IP
Compare-Object -ReferenceObject $machine1 -DifferenceObject $machine2 -Property HotfixID -IncludeEqual