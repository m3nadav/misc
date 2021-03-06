# If you must ensure that a PowerShell script runs with Admin privileges, you can add this to the beginning of your script

$identity = [Security.Principal.WindowsIdentity]::GetCurrent()
$principal = new-object Security.Principal.WindowsPrincipal $identity
if ($principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)  -eq $false) {
$Args = '-noprofile -nologo -executionpolicy bypass -file "{0}"' -f $MyInvocation.MyCommand.Path
Start-Process -FilePath 'powershell.exe' -ArgumentList $Args -Verb RunAs
exit 
}
"Running with Admin Privileges"
Read-Host "PRESS ENTER"