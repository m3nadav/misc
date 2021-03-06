$head = @' 

     &ltstyle&gt 

          body { font-family:Consolas } 

          &lt/style&gt 

     &lttitle&gtProcess List&lt/title&gt

'@

$path = "$env:temp\report.hta"

Get-Process | Select-Object Name, Company, ID, HandleCount, CPU | ConvertTo-Html -Head $head -PreContent '&ltH1&gtProcess List&lt/H1&gt' | Out-File $path

Invoke-Item $path 