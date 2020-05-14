<# Normally, when you launch a program from inside PowerShell you lose contact.
However, using Start-Process with the -passthru parameter 
you will return the process object, which you can then store and later use
to check the execution status, error codes, or even kill the program.
#>
$process = Start-Process notepad.exe -passThru
$process
$process.Kill()