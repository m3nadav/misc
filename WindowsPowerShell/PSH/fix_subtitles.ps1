param($file_path="D:\Users\nadav\Downloads\The Mask\The.Mask.srt")
$file = (gc $file_path)
$output_file = $file+"2"
$file2 = @()

function timeObj{
    param($time)
    $hours,$minutes,$seconds,$mili=$time.Split(":,")

    $myObj = "" | select hours,minutes,seconds,mili
    $myObj.hours=$hours
    $myObj.minutes=$minutes
    $myObj.seconds=$seconds
    $myObj.mili=$mili
    
    
    
    $myObj | Add-Member -PassThru scriptMethod -Force toString {"{0}:{1}:{2},{3}" -f $this.hours,$this.minutes,$this.seconds,$this.mili} | Out-Null
    return $myObj   
}

function addTime{
    param($time,$addTime="00:00:00.000")
    $time = timeObj $time
    $addTime = timeObj $addTime
    [int]$time.hours = [int]$time.hours+[int]$addTime.hours
    [int]$time.minutes = [int]$time.minutes+[int]$addTime.minutes
    [int]$time.seconds = [int]$time.seconds+[int]$addTime.seconds
    [int]$time.mili = [int]$time.mili+[int]$addTime.mili
    
    if ($time.mili -ge 1000) {
        $time.mili -= 1000
        $time.seconds += 1
    }
    if ($time.seconds -ge 60) {
        $time.seconds -= 60
        $time.minutes += 1
    }
    if ($time.minutes -ge 60) {
        $time.minutes -= 60
        $time.hours += 1
    }
    
    [string]$time.hours = ("0"*(2-([string]$time.hours).length))+[string]$time.hours
    [string]$time.minutes = ("0"*(2-([string]$time.minutes).length))+[string]$time.minutes
    [string]$time.seconds = ("0"*(2-([string]$time.seconds).length))+[string]$time.seconds
    [string]$time.mili = ("0"*(3-([string]$time.mili).length))+[string]$time.mili

    
    return $time.toString()
}

function subTime{
    param($time,$subTime="00:00:00.000")
    $time = timeObj $time
    $subTime = timeObj $subTime
    [int]$time.hours = [int]$time.hours-[int]$subTime.hours
    [int]$time.minutes = [int]$time.minutes-[int]$subTime.minutes
    [int]$time.seconds = [int]$time.seconds-[int]$subTime.seconds
    [int]$time.mili = [int]$time.mili-[int]$subTime.mili
    
    if ($time.mili -lt 0) {
        $time.mili += 1000
        $time.seconds -= 1
    }
    if ($time.seconds -lt 0) {
        $time.seconds += 60
        $time.minutes -= 1
    }
    if ($time.minutes -lt 0) {
        $time.minutes += 60
        $time.hours -= 1
    }
    
    [string]$time.hours = ("0"*(2-([string]$time.hours).length))+[string]$time.hours
    [string]$time.minutes = ("0"*(2-([string]$time.minutes).length))+[string]$time.minutes
    [string]$time.seconds = ("0"*(2-([string]$time.seconds).length))+[string]$time.seconds
    [string]$time.mili = ("0"*(3-([string]$time.mili).length))+[string]$time.mili

    
    return $time.toString()
}

#$addTime = "01:05:56,340"
$Time = "00:12:00,000"


$file | % {
    if ($_ -match "\d\d:\d\d:\d\d.\d\d\d --> \d\d:\d\d:\d\d.\d\d\d") {
        $start_time,$end_time=$_.Split(" --> ")
        $end_time = $end_time[4]
        $file2 += (subTime $start_time $Time)+" --> "+(subtime $end_time $Time)
        
    }
    else {
    $file2 += $_ 
    }
}

$file2 > $output_file