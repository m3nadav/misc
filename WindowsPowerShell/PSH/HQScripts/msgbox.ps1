[System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null
 
$rv = [Microsoft.VisualBasic.Interaction]::MsgBox('Do you want this to happen?', 'YesNoCancel,Exclamation,MsgBoxSetForeground,SystemModal', 'Accept or Deny')

Switch ($rv) {
 'Yes'    { "OK, we'll do it!" }
 'No'     { "Next time maybe..." }
 'Cancel' { "you cancelled..."} 
}

# or,- for Popup only, you can use Wscript.shell
$shell = New-Object -comobject "Wscript.shell"
$shell.popup("get out ;-)")