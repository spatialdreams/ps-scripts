$PSVersionTable.PSVersion

#
#parse command line arguments
#

param (
[string]$desiredRuntime = "default"
  [Parameter(Mandatory=$true)][string]$delay,
  [string]$display = $("true")
)

#
#data snapshot
#

function snapshot() {
  $os = Get-Ciminstance Win32_OperatingSystem 
  $key += Get-Date -Uformat %T  
  $vramUsage += 
  $memUsage += [math]::Round(($os.FreePhysicalMemory/$os.TotalVisibleMemorySize)*100,2)
  $cpuLoad +=
}


#program specific
$day = Get-Date -Uformat %D 
$startTime = Get-Date -Uformat %T
$endTime = Get-Date -Uformat %T
$elapsedTime = NEW-TIMESPAN -Start $startTime -End $endTime

#user specific
$motherboard = gwmi win32_baseboard
$videoController = wmic path win32_videocontroller get name 
$processor = Get-Ciminstance -ClassName win32_processor | format-list
$ram = gwmi win32_physicalmemory


#ram info to gather from RAM
#"BankLabel":

if ($desiredRunTime.Contains("H" -or "M" -or "S")) {
  for { 
	  
  }
} elseif ($desiredRunTime.Contains("always") {

}

	
#
# Object Structure
#

$header = @{
  ProgramInfo = @{
    date = $day,
    endTime = $endTime
    startTime = $startTime
    elapsed = $elapsedTime
    }
  cpu: @{
    Name = $,
    Manufacturer = $,
    SocketDesignation = $,
    CurrentClockSpeed = $,
    MaxClockSpeed = $,
    NumberOfCores = $, 
    NumberOfEnabledCore = $, 
    NumberOfLogicalProcessors = $,
    L2CacheSize = $, 
    L2CacheSpeed = $, 
    L3CacheSize = $, 
    L3CacheSpeed = $, 
    Architecture = $,
    Family = $,
    ExtClock = $,  
    DeviceID = $,
    UniqueId = $
    }
  memory: @{
    Brand = $,
    modules = $,
    totalMemory = $,
     = $,
     = $
    }
  motherboard: @{
    Brand = $,
     = $,
     = $,
     = $
    }
  videocontroller: @{
     = $,
     = $,
     = $,
     = $
    }
}
	
Payload @{	 
  [scan$i]@{
    ramUsage = $,
	cpuUsage = $,
	cpuTemp = $,
	gpuUsage = $,
	gpuTemp = $,
	 = $
  }
}
