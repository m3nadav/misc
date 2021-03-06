$archive_dir = "C:\Labs\Archive\Archive2"
$scan_dir = "C:\Labs\LabFiles"
$file_age = 45
# if archive dir doesnt exist create it
if ( (Test-Path $archive_dir) -eq $false ) {
    [void](mkdir $archive_dir)
}
#get all files' objects
Set-Location $scan_dir
$files = Get-ChildItem -recurse | where { ($_.GetType()).name -eq "FileInfo" }
if (!$files){
    throw "There Are No Files in the scan directory"
}
<#
create a filter function that
archives files older than 60 days.
#>
filter archiveFiles {
    $now = Get-Date
    $last_write_time = $_.lastWriteTime
    if ( ($now - $last_write_time).days -gt 60 ) {
        #creates the relative path of the file in the archive dir.
            $full_path = $_.fullname.replace($scan_dir,$archive_dir)
            $full_path = $full_path.Substring(0,$full_path.LastIndexOf('\'))
            if ( (Test-Path $full_path) -eq $false){
                [void](mkdir $full_path)
            }
        #move the file.
        Move-Item $_.fullname $full_path
    }
}

$files | archiveFiles