
$event_headers = Get-EventLog security | 
where {$_.EntryType -eq "FailureAudit"} | 
select @{e={"<a href='EventsMessages.html#"+($_.Index).tostring()+"'>"+($_.index).tostring()+"</a>"}; n="Index"}, EventID, MachineName, EntryType, Source, TimeGenerated
$body = '<table><th>Index</th><th>EventID</th><th>MachineName</th><th>EntryType</th><th>Source</th><th>TimeGenerated</th>'
foreach ($i in $event_headers) {
    $body = $body + "<tr><td>"+$i.index.toString()+"</a></td><td>"+$i.EventID.toString()+"</td><td>"+$i.MachineName.toString()+"</td><td>"+$i.EntryType.toString()+"</td><td>"+$i.Source.toString()+"</td><td>"+$i.TimeGenerated.toString()+"</td></tr>"
}
$body = $body + "</table>"


ConvertTo-Html -title "Logons Failure Events" -body $body| 
Out-File Labs:\FailureEvents.html



$events_messages = Get-EventLog security | 
where {$_.EntryType -eq "FailureAudit"} | 
select index, Message, EventID
$body = '<table>'
foreach ($i in $events_messages) {
    $i.Message
    $body = $body + "<tr><td><a name='"+$i.Index.toString()+"'><B>Message EventID: "+$i.EventID.toString()+"</b></td></tr><tr><td><pre>"+$i.Message.toString()+"</pre></td></tr>"
}
$body = $body + "</table>"

ConvertTo-Html -title "Events' Messages" -body $body| 
Out-File Labs:\EventsMessages.html
