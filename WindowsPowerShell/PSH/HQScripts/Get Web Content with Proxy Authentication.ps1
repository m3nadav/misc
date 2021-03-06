function Get-Webclient { 
    $wc = New-Object Net.WebClient
    $wc.UseDefaultCredentials = $true
    $wc.Proxy.Credentials = $wc.Credentials
    $wc
} 

# now call the function
$webclient = Get-WebClient
[xml]$powershelltips = $webClient.DownloadString('http://powershell.com/cs/blogs/tips/rss.aspx')
$powershelltips.rss.channel.item | Select-Object title, link

# without Proxy AuthN 
# simple:
$wc = New-Object Net.WebClient
[xml]$powershelltips = $webClient.DownloadString('http://powershell.com/cs/blogs/tips/rss.aspx')
$powershelltips.rss.channel.item | Select-Object title, link