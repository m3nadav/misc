try
{
   $wc = new-object System.Net.WebClient
   $wc.DownloadFile("http://localhost/MyDoc.doc")
}
catch [System.Net.WebException],[System.IO.IOException]
{
    "Unable to download MyDoc.doc from http://localhost"
}
catch
{
    "An error occurred that could not be resolved."
}
finally
{
# final statments, like reseting varibles etc.
# Note: Finally runs every time the script is run, even if the Try statement ran without error
}