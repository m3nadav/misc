start-Process Outlook
$o = New-Object -com Outlook.Application
$mail = $o.CreateItem(0)
$mail.subject = “My message“
$mail.body = “First line`nSecond Line`nThird line“
$mail.To = “user@domain.com“
#$mail.Attachments.Add(“C:\somefile.txt”)
$mail.Send()
$o.Quit()