[System.Console]::Beep()
# longer...
[System.Console]::Beep(1000,300)
# or even longer...
[System.Console]::Beep(1000,2000)

# you can also play System media  sounds: 
[system.media.systemsounds]::Beep.play()
[system.media.systemsounds]::Asterisk.play()
[system.media.systemsounds]::Exclamation.play()
[system.media.systemsounds]::Hand.play()