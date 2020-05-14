gwmi win32_logicaldisk | where {$_.drivetype -eq 3} | ForEach-Object {
write-host $_.name "Total Size" ($_.Size /1gb) "Free Space" ($_.FreeSpace /1gb)
}
