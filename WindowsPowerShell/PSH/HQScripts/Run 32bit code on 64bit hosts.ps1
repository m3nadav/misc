
$32bitcode = {
 [IntPtr]::Size
 }

# run on 64bit machine directly
& $32bitcode

# run in isolated 32bit session
$job = Start-Job $32bitcode -runAs32
$job| Wait-Job |Receive-Job
Remove-Job $job
"Done"