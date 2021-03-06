function Disable-NetworkAdapter {
 param(
   $name    )
        Get-WmiObject Win32_NetworkAdapter -Filter "NetConnectionID='$name'" |     
        ForEach-Object { 
        $rv = $_.Disable().ReturnValue      
        if ($rv -eq 0) {
        '{0} disabled' -f $_.Caption      
        } else {
            '{0} could not be disabled. Error code {1}' -f $_.Caption, $rv      
               }
        }
}

function Enable-NetworkAdapter {
 param(
   $name    )
      Get-WmiObject Win32_NetworkAdapter -Filter "NetConnectionID='$name'" |     
      ForEach-Object { 
      $rv = $_.Enable().ReturnValue      
      if ($rv -eq 0) {
      '{0} enabled' -f $_.Caption      
      } else {
       '{0} could not be enabled. Error code {1}' -f $_.Caption, $rv      
       }
     }
}

function Restart-NetworkAdapter {
 param(
   $name    )
 Disable-NetworkAdapter $name 
 Enable-NetworkAdapter $name 
}

# reset a network adapter 
Restart-NetworkAdapter LAN