[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")

function Do-Action-On-Drop-Down 
{
$shellobj = New-Object -Com "wscript.shell"
$shellObj.popup(   )
$shellObj.popup($address.text)
$Form.Close()
}

$Form = New-Object System.Windows.Forms.Form

$Form.width = 300
$Form.height = 200
$Form.Text = "My Form ;-)"
$Form.maximumsize = New-Object System.Drawing.Size(300,200)
$Form.startposition = "centerscreen"
$Form.KeyPreview = $True
$Form.Add_KeyDown({if ($_.KeyCode -eq "Enter") 
    {Do-Action-On-Drop-Down}})
$Form.Add_KeyDown({if ($_.KeyCode -eq "Escape") 
    {$Form.Close()}})

$DropDown = new-object System.Windows.Forms.ComboBox
$DropDown.Location = new-object System.Drawing.Size(50,10)
$DropDown.Size = new-object System.Drawing.Size(130,30)

$DropDownArray = "DC3", "SRV2", "PC1"
ForEach ($Item in $DropDownArray) {
	$DropDown.Items.Add($Item)
}

$Form.Controls.Add($DropDown)

$DropDownLabel = new-object System.Windows.Forms.Label
$DropDownLabel.Location = new-object System.Drawing.Size(10,10)
$DropDownLabel.size = new-object System.Drawing.Size(100,20)
$DropDownLabel.Text = "Host"
$Form.Controls.Add($DropDownLabel)

$Button = new-object System.Windows.Forms.Button
$Button.Location = new-object System.Drawing.Size(100,150)
$Button.Size = new-object System.Drawing.Size(100,20)
$Button.Text = "OK"
$Button.Add_Click({Do-Action-On-Drop-Down})
$form.Controls.Add($Button)

$address = new-object System.Windows.Forms.TextBox
$address.Location = new-object System.Drawing.Size(100,100)
$address.Size = new-object System.Drawing.Size(100,20)

$Form.Controls.Add($address)

$addresslabel = new-object System.Windows.Forms.Label
$addresslabel.Location = new-object System.Drawing.Size(10,100)
$addresslabel.size = new-object System.Drawing.Size(100,20)
$addresslabel.Text = "Enter host name"
$Form.Controls.Add($addresslabel)

# show form
$Form.Add_Shown({$Form.Activate()})
$Form.ShowDialog()

