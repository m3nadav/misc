$Session = New-PSSession -ComputerName lon-dc1 -Authentication Kerberos
# See the session you created on the remote machine
$Session # or 
Get-PSSession -ComputerName lon-dc1
# add modules to the Remote Session
Invoke-command -session $Session {import-module ActiveDirectory}

# import session from remote machine to local machine
Import-PSSession -session $Session -Module activedirectory 
# or,- connect directly to remote session
#Enter-PSSession -Session $Session

# clean up..
Remove-PSSession $Session