Function Global:Copy2Clipboard ($Clip) {
$code = @'
Imports Microsoft.VisualBasic
Imports System
Namespace ClipboardAddon
    Public Class Utility
    Private Declare Function OpenClipboard Lib "user32" _
          (ByVal hwnd As Integer) As Integer
    Private Declare Function EmptyClipboard Lib "user32" _
        () As Integer
    Private Declare Function CloseClipboard Lib "user32" _
        () As Integer
    Private Declare Function SetClipboardData Lib "user32" _
        (ByVal wFormat As Integer, ByVal hMem As Integer) As Integer
    Private Declare Function GlobalAlloc Lib "kernel32" _
        (ByVal wFlags As Integer, ByVal dwBytes As Integer) As Integer
    Private Declare Function GlobalLock Lib "kernel32" _
        (ByVal hMem As Integer) As Integer
    Private Declare Function GlobalUnlock Lib "kernel32" _
        (ByVal hMem As Integer) As Integer
    Private Declare Function lstrcpy Lib "kernel32" (ByVal _
        lpString1 As Integer, ByVal lpString2 As String) As Integer
    
    Public Shared Sub CopyToClipboard(ByVal text As String)
        Dim result As Boolean = False
        Dim mem As Integer = GlobalAlloc(&H42, text.Length + 1)
        Dim lockedmem As Integer = GlobalLock(mem)
        lstrcpy(lockedmem, text)
        If GlobalUnlock(mem) = 0 Then
            If OpenClipboard(0) Then
                   EmptyClipboard()
                   result = SetClipboardData(1, mem)
                   CloseClipboard()
                End If
            End If
        End Sub
    End Class
End Namespace
'@

$provider = New-Object Microsoft.VisualBasic.VBCodeProvider
$params = New-Object System.CodeDom.Compiler.CompilerParameters
$params.GenerateInMemory = $True
$refs = "System.dll","Microsoft.VisualBasic.dll"
$params.ReferencedAssemblies.AddRange($refs)
$results = $provider.CompileAssemblyFromSource($params, $code)

# $results 
[clipboardaddon.Utility]::CopyToClipboard($clip)
}

# $object = New-Object clipboardaddon.Utility
# $object.CopyToClipboard("ahalan! :-)")

Copy2Clipboard "ahalan ;-)"