# $diskdrive - harddisk related info
# $diskpartition - partition related info
# $Logicaldrive - Drive related info
cls

$diskdrives = Get-WmiObject win32_diskdrive

foreach($diskdrive in $diskdrives){
	Write-Host "---------------------------------------------------------"
	Write-Host "Disk:" $diskdrive.Index  "`n SCSI:"  $diskdrive.SCSIBUS  "`n SCSITargetID:" $diskdrive.SCSITargetID  "`n SCSILU:SCSILogicalUnit"
	foreach($diskpartition in $diskdrive.getrelated("win32_diskpartition")){
	Write-Host "Disk Partition:" $diskpartition.NAME
	FOREACH($LOGICALDRIVE IN $diskpartition.getrelated("win32_logicaldisk")){
	write-host "Logical drive:" $LOGICALDRIVE.name
	}
	}
	
}
