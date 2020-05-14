#files
$Now = get-date
$Now
set-location C:\temp
$files = dir –recurse | where {($_.GetType()).name -eq "FileInfo"}
$files

foreach ($file in $files) {
$age=($Now.subtract(($file.LastWriteTime))).days
if ($age –gt 60) {
write-host $file.name
Move-Item $file c:\OldFiles
}
}
