param($country)

$webClient = new-object system.net.webclient
[xml]$coins = $webClient.DownloadString("http://bankisrael.gov.il/currency.xml")
$coins.CURRENCIES.CURRENCY | sort country | ft country,name -autosize

if ($country) {
}
else {
    $country = read-host -prompt "choose a country please"
}

$coins.CURRENCIES.CURRENCY | where {$_.country -like "*$country*"} | ft Name, CurrencyCode, Country, Rate, Change -autosize
