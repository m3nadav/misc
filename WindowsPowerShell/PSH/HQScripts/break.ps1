Do {
$pwd = Read-Host 'Enter your password'
If ($pwd -eq 'topsecret') { break }
} While ($true)