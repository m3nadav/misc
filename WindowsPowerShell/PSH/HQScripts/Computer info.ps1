$CompSys = Get-WmiObject Win32_ComputerSystem -EnableAllPrivileges
Write-Host "Host name:"$Compsys.caption
if ($compsys.PartofDomain -eq $false) {Write-Host "Workgroup:" $compsys.workgroup
}
else
{Write-Host "Domain:" $compsys.Domain}
Write-Host "Number of Processors:"$compsys.NumberOfProcessors "Processor Cores:"$compsys.NumberOfLogicalProcessors
Write-Host "System Type:"$compsys.SystemType
