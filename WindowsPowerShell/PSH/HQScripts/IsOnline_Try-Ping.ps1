function global:IsOnline
{
param([string]$hostname)
#$ErrorActionPreference = "SilentlyContinue"
if ($hostname -eq "")
	{
    Write-Host "Please supply a host name." -ForegroundColor blue
    break
    }
$ping = New-Object System.Net.NetworkInformation.Ping 
if ($ping.Send($hostname).status -eq "Success") 
	{
	write-host "Host $hostname is ONLINE" -ForegroundColor green
    break
	}
else
	{
	write-host "Host $hostname is OFFLINE" -ForegroundColor red
	}
}

IsOnline
IsOnline localhost
IsOnline www.google.com
IsOnline 10.1.1.4

#Set-PSDebug -Step

#simple:
#$hostname = "localhost"
#$ping = New-Object System.Net.NetworkInformation.Ping  
#if ($ping.Send($hostname).status -eq "Success") {write-host $TRUE} else {write-host $FALSE}
