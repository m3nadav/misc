$CustomScriptRoot = (ls variable:PSScriptRoot).value
[void](new-psdrive -name psh -psprovider filesystem -root $CustomScriptRoot\PSH)
#[void](new-psdrive -name works -psprovider filesystem -root M:\wamp\www)
cd psh:
