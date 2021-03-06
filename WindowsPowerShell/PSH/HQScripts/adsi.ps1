# adsi
$root = [adsi]""
$root
$rootdn = $root.distinguishedName
$rootdn
$root.psbase
$root.psbase | gm
$root.psbase.children

$dirsrch = new-object System.DirectoryServices.DirectorySearcher $rootdn
$dirsrch.Filter = “(objectCategory=user)”
$dirsrch.FindAll()
$dirsrch.FindAll() | where {$_.Path –like “*wst*”}
$results = $dirsrch.FindAll() | where {$_.Path –like “*wst*”}
$results | gm
$results[30].get_properties()
foreach ($r in $results) {$r.get_properties()[“cn”]}
$OU = “TestPS”
$domain = [ADSI]”LDAP://DC=contoso,DC=COM”
$newOU = $domain.create(“OrganizationalUnit”,”OU=$OU”)
$newOU.SetInfo()
$domain.psbase.children
$newUser = $newOU.Create(“user”,”CN=Casey”)
$newUser.Put(“sAMAccountName”,”Casey”)
$newUser.Put(“givenname”,”Casey”)
$newUser.Put(“sn”,”theDog”)
$newUser.Put(“userprincipalName”,”Casey@tailspintoys.com”)
$newUser.SetInfo()
$newUser.psbase.Invoke(“SetPassword”,”P@ssw0rd”)
$newUser.psbase.InvokeSet(‘Accountdisabled’,$false)
$newUser.psbase.CommitChanges()
#•	Now it’s group time…let’s create a global security group in our new OU.
$newGroup = $newOU.Create(“group”,”CN=Dogs”)
$newGroup.Put(“grouptype”,-2147483646)
$newGroup.SetInfo()
#•	What’s a group without members? It’s time to send Casey to the Dogs…
$newGroup.Add(“LDAP://”+$newuser.distinguishedname)
cls
