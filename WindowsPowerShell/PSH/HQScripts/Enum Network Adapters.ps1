# Getting ONLY the adapters in Control Panel
function GetNet {
 Get-WmiObject Win32_NetworkAdapter -Filter 'NetConnectionID!=null'}

# Now you can list all network adapters and check their status. For example:

GetNet | select caption, NetCon*