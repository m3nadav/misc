#•	Working with New-Object
$Network = New-Object -com "Wscript.network"
$Network.EnumPrinterConnections()
$printers = $Network.EnumPrinterConnections()
$printers | gm
$Network | gm
$Network.UserName
$network.UserDomain