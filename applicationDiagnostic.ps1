#not really imports, but they are imports
$PSVersionTable.PSVersion
$mb = gwmi win32_baseboard
$vc = wmic path win32_videocontroller get name 
$cpu = Get-Ciminstance -ClassName win32_processor 
$ram = gwmi win32_physicalmemory

#
#parse command line arguments
#

param (
  [string]$runtime = "default",
  [Parameter(Mandatory=$true)][Int32]$delay,
  [string]$display
)

if ($runtime.Contains("H" -or "M" -or "S")) {
  for (i in len($runtime)){ 
    
  }
} elseif ($runtime.Contains("program") {

}

	
#
# Object Structure
#

$startTime = Get-Date -Uformat %T

Payload @{	 
  [scan$i]@{
  
    ramUsage = [math]::Round(($os.FreePhysicalMemory/$os.TotalVisibleMemorySize)*100,2),
	vramUsage = $,
    cpuUsage = $,
    cpuTemp = $,
    gpuUsage = $,
    gpuTemp = $
  }
}

$endTime = Get-Date -Uformat %T
$elapsedTime = NEW-TIMESPAN -Start $startTime -End $endTime

$header = @{
  ProgramInfo = @{
    date = $day,
    endTime = $endTime
    startTime = $startTime
    elapsedTime = $elapsedTime
    }
  cpu: @{
    Name = $cpu.name,
    Manufacturer = $cpu.manufacturer,
    SocketDesignation = $cpu.socketdesignation,
    CurrentClockSpeed = $cpu.currentclockspeed,
    MaxClockSpeed = $cpu.maxclockspeed,
    NumberOfCores = $cpu.numberofcores, 
    NumberOfEnabledCore = $cpu.numberofenabledcore, 
    NumberOfLogicalProcessors = $cpu.numberoflogicalprocessors,
    L2CacheSize = $cpu.l2cachesize, 
    L2CacheSpeed = $cpu.L2CacheSpeed, 
    L3CacheSize = $cpu.L3CacheSize, 
    L3CacheSpeed = $cpu.L3CacheSpeed, 
    Architecture = $cpu.Architecture,
    Family = $cpu.Family,
    ExtClock = $cpu.extfamily,  
    DeviceID = $cpu.deviceid,
    UniqueId = $cpu.uniqueid
    }
  memory: @{
    Manufacturer = $,
    modules = $,
    TotalMemory = $,
     = $,
     = $
    }
  motherboard: @{
    Manufacturer = $mb.manufacturer,
    SerialNumber = $mb.serialnumber,
    ProductCode = $mb.prodcut
    }
  videocontroller: @{
     Manufacturer= $,
     = $,
     = $,
     = $
    }
}
