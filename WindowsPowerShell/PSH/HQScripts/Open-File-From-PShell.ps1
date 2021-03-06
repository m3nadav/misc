function Global:OpenFile
{
[System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null
$dialog = New-Object System.Windows.Forms.OpenFileDialog
$dialog.DefaultExt = '.ps1'
$dialog.Filter = 'PowerShell Scripts :-)|*.ps1|All Files|*.*'
$dialog.FilterIndex = 0
$dialog.InitialDirectory = $home
$dialog.Multiselect = $false
$dialog.RestoreDirectory = $true
$dialog.Title = "Select a script file ;-)"
$dialog.ValidateNames = $true
$dialog.ShowDialog()
#$dialog.FileName
& $dialog.FileName
}

Write-Host "To use this function, type:"`n "powershell -sta -file .\Open-File-From-PShell.ps1"`n "and then run OpenFile"