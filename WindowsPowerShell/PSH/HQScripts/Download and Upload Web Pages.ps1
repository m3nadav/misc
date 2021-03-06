# Simple Download:

$url = "https://www.mysite.com/myPage.html"
$wc = new-object system.net.WebClient 
$webpage = $wc.DownloadData($url) 
$response = [System.Text.Encoding]::ASCII.GetString($webpage)

# Download using Query Strings:

$url = "https://www.mysite.com" 
$col = new-object System.Collections.Specialized.NameValueCollection 
$col.Add("id","43") 
$col.Add("k","jhg54e") 
$wc = new-object system.net.WebClient 
$wc.QueryString = $col 
$webpage = $wc.DownloadData($url) 
$string = [System.Text.Encoding]::ASCII.GetString($webpage) 

# Upload using a String:

$url = "https://www.mysite.com" 
$postData = "id=43&k=jhg54e" 
$wc = new-object system.net.WebClient 
$wc.Headers.Add("Content-Type","application/x-www-form-urlencoded") 
[byte[]]$byteArray = [System.Text.Encoding]::ASCII.GetBytes($postData) 
$webpage = $wc.UploadData($url,"POST",$byteArray); 
$response = [System.Text.Encoding]::ASCII.GetString($webpage) 

#Upload using a Collection:

$url = "https://www.mysite.com/myscript.cgi" 
$wc = new-object system.net.WebClient 
$col = new-object System.Collections.Specialized.NameValueCollection 
$col.Add("id","43") 
$col.Add("k","jhg54e") 
$wc.QueryString = $col 
$webpage = $wc.UploadValues($url, "POST", $col) 
$response = [System.Text.Encoding]::ASCII.GetString($webpage)