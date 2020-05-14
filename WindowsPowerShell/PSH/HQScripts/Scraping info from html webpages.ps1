$regex = [RegEx]'<p align="left" dir="ltr">(.*?)</p>'
$url = 'http://www.orphaned-land.com/news.html'
$wc = New-Object System.Net.WebClient
$content = $wc.DownloadString($url)
$regex.Matches($content) | Foreach-Object { $_.Groups[1].Value }