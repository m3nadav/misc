<#
Get-Itemproperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' | select registeredOwner
" "
"is about to change to nadav"
Set-ItemProperty -path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -name RegisteredOwner -value "Nadav"
#>
filter cutkeyname { $name = $_.name.Substring($_.name.LastIndexOf('\')+1); $name}

$path = "HKLM:\Software"
Write-Host "You are at: $path `n -----------------------"
Get-ChildItem HKLM:\Software | cutkeyname
$cmd = Read-Host "where would you like to go now? "

while ($cmd -ne "stop") {
    $path = $path+"\"+$cmd
    Write-Host "You are at: $path `n -----------------------"
    Get-ChildItem $path | cutkeyname
    
    $cmd = Read-Host "and now? "
}
"you stopped in $path"