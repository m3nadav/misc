# If you would like to programmatically control page file settings, you can use WMI but must enable all privileges using -EnableAllPrivileges.

$c = Get-WmiObject Win32_ComputerSystem -EnableAllPrvileges
$c.AutomaticManagedPagefile = $false
$c.Put()