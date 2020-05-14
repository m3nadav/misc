$regex = [RegEx]'<div class="post-summary">(.*?)</div>'
$url = 'http://blogs.msdn.com/b/powershell/'
$wc = New-Object System.Net.WebClient
$content = $wc.DownloadString($url)
$regex.Matches($content) | Foreach-Object { $_.Groups[1].Value }