# registry
new-item -path hklm:\Software\TestNew2 -Value TestME
#•	To add a value to that key enter:
new-itemproperty -path HKLM:\Software\TestNew -name "pstest" -value "pstestvalue"
get-itemproperty -path HKLM:\Software\testnew -name pstest
#•	To change an existing value, enter
set-itemproperty -path HKLM:\Software\TestNew -name "pstest" -value "newtestvalue"
get-itemproperty -path HKLM:\Software\TestNew -name pstest 
