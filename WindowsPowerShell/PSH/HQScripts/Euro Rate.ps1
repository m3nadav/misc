$wc = New-Object System.Net.WebClient 

$rates=[xml]$wc.DownloadString("http://www.bankisrael.gov.il/currency.xml") 

$EU = $rates.CURRENCIES.CURRENCY | where {$_.name -eq "euro" -and $_.currencycode -eq "EUR"}

$EU | ft name, currencycode, rate