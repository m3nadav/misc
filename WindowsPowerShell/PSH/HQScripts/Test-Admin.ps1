function Test-Admin {
 $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
 $principal = new-object Security.Principal.WindowsPrincipal $identity 
 $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)   
}

Test-Admin