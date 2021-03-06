<# 
This will find all PowerShell scripts on drive c:\ and check their digital signature. 
Any script without a signature or having an invalid signature will get reported back to you. 
Next, you can double-check those scripts and then sign them if they are OK
#>
Get-Childitem c:\ *.ps1 –Recurse –ea 0 | Get-AuthenticodeSignature | 
 Where-Object { $_.Status –ne ‘Valid’ }
