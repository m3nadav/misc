# first,create a file
gps | Export-Clixml c:\temp\data.xml

# use MEASURE-COMMAND with get-content
Measure-Command { Get-Content c:\temp\data.xml }

# try this!
Measure-Command { [System.IO.File]::ReadLines(“c:\temp\data.xml“) }

# Also,- If you want to read the text as one large string Very fast, use this approach:
[System.IO.File]::ReadAllText(“c:\somefile.txt“) 


