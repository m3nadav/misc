function Do-Something {
 [CmdletBinding()]
 param(
 $name,
 $surname = "Default",
 $age,
 $id
 )
 
 # treat all submitted parameters as hashtable:
 $param = $PSCmdlet.MyInvocation.BoundParameters

 # act in response of submitted and omitted parameters:
 if ($params.ContainsKey('name')) {
  'You specified -name and submitted {0}' -f $param['name']
 } else {
  'You did not specify -name'
 }
}

Do-Something
You did not specify -name

Do-Something -id 1
You did not specify -name

Do-Something -name weltner
You specified -name and submitted weltner