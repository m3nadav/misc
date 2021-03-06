$ErrorActionPreference = "silentlycontinue"
function gui {
    [void][System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
    [void][System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")

    function Do-Action-On-Drop-Down
    {
        $GLOBAL:eventlog = $DropDown.SelectedItem.tostring()
        $GLOBAL:remote_host = $address.text
        if ($eventlog -ne '') {
            $Form.Close()
        }
        else {
            $GLOBAL:shellobj = New-Object -Com "wscript.shell"
            $shellObj.popup("Please choose EventLog")
        }
    }

    $Form = New-Object System.Windows.Forms.Form

    $Form.width = 325
    $Form.height = 170
    $Form.Text = "EventLog reader"
    $Form.maximumsize = New-Object System.Drawing.Size($Form.width,$Form.height)
    $Form.startposition = "centerscreen"
    $Form.KeyPreview = $True
    $Form.Add_KeyDown({if ($_.KeyCode -eq "Enter") 
        {Do-Action-On-Drop-Down}})
    $Form.Add_KeyDown({if ($_.KeyCode -eq "Escape") 
        {$Form.Close()} } )

    $DropDown = new-object System.Windows.Forms.ComboBox
    $DropDown.Location = new-object System.Drawing.Size(160,10)
    $DropDown.Size = new-object System.Drawing.Size(130,30)

    $DropDownArray = "Application", "Security", "System"
    ForEach ($Item in $DropDownArray) {
    	[void]($DropDown.Items.Add($Item))
    }

    $Form.Controls.Add($DropDown)

    $DropDownLabel = new-object System.Windows.Forms.Label
    $DropDownLabel.Location = new-object System.Drawing.Size(10,12)
    $DropDownLabel.size = new-object System.Drawing.Size(150,20)
    $DropDownLabel.Text = "Please choose an EventLog:"
    $Form.Controls.Add($DropDownLabel)

    $address = new-object System.Windows.Forms.TextBox
    $address.Location = new-object System.Drawing.Size(100,50)
    $address.Size = new-object System.Drawing.Size(100,20)
    $address.text='localhost'
    $Form.Controls.Add($address)

    $addresslabel = new-object System.Windows.Forms.Label
    $addresslabel.Location = new-object System.Drawing.Size(10,50)
    $addresslabel.size = new-object System.Drawing.Size(100,20)
    $addresslabel.Text = "Enter host name:"
    $Form.Controls.Add($addresslabel)
    
    $Button = new-object System.Windows.Forms.Button
    $Button.Location = new-object System.Drawing.Size(100,100)
    $Button.Size = new-object System.Drawing.Size(100,20)
    $Button.Text = "OK"
    $Button.Add_Click({Do-Action-On-Drop-Down})
    $form.Controls.Add($Button)


    # show form
    $Form.Add_Shown({$Form.Activate()})
    $Form.ShowDialog()


}


param ($eventlog, $remote_host="localhost")
if ((!$eventlog) -or $eventlog -eq '') {
    gui
}

#check existing computer
Test-Connection $remote_host -count 1
if (!$?) {
    $shellObj.popup("Remote host is not online or not answering to pings")    
    exit
}


$error_events = Get-EventLog $eventlog -ComputerName $remote_host | where{$_.entrytype -eq "error"} 
if (!$error_events) {
$shellobj = New-Object -Com "wscript.shell"
$shellObj.popup("There are no errors :)")
}

# for rerunning the script
$eventlog=''
$ErrorActionPreference = "continue"



