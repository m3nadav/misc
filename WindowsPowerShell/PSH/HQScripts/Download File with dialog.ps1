[reflection.assembly]::LoadWithPartialName("Microsoft.VisualBasic") | Out-Null

$url = 'http://www.idera.com/images/Tours/Videos/PowerShell-Plus-IDE-1.wmv'

$dest = "c:\video.wmv"

$object = New-Object Microsoft.VisualBasic.Devices.Network

$object.DownloadFile($url, $dest, "", "", $true, 500, $true, "DoNothing")

Invoke-Item $dest