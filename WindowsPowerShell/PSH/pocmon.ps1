$ps=gps
$owner = @{}

$pswmi = gwmi win32_process

$pswmi | foreach { $owner[$_.processid] = $_.getowner().user; }


$owner

#$ps | where {$_.id -eq 5124}