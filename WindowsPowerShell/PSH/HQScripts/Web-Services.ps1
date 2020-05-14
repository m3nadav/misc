$a = New-WebServiceProxy 'http://www.webservicex.net/globalweather.asmx?WSDL'
#$a.GetCitiesByCountry('israel')
[xml]$TLVweather = $a.GetWeather('ben-gurion international airport','israel')
[xml]$ParisWeather = $a.GetWeather('paris-orly','france')
Write-host "Weather in Tel-Aviv is"$tlvweather.CurrentWeather.SkyConditions",temperature is"$tlvweather.CurrentWeather.Temperature
Write-host "Weather in Paris is"$parisweather.CurrentWeather.SkyConditions",temperature is"$parisweather.CurrentWeather.Temperature
#$TLVweather.CurrentWeather
#$ParisWeather.CurrentWeather
