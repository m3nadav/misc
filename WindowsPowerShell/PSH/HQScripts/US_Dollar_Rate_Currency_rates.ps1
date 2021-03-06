$wc = New-Object System.Net.WebClient 

$rates=[xml]$wc.DownloadString("http://www.bankisrael.gov.il/currency.xml") 
$rates.CURRENCIES.CURRENCY 

# get only dollar rate
$USD = $rates.CURRENCIES.CURRENCY | where {$_.name -eq "dollar" -and $_.currencycode -eq "USD"}
$USD | ft name, currencycode, rate