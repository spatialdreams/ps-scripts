#get system info
$PSVersionTable.PSVersiong
$mb = gwmi win32_baseboard
$vc = gwmi win32_videocontroller 
$ram = gwmi win32_physicalmemory
$cpu = gwmi win32_processor 

#
#parse command line arguments
#
param (
  [string]$runtime = "default",
  [Parameter(Mandatory=$true)][Int32]$delay,
  [string]$display
)

if ($runtime.Contains("H" -or "M" -or "S")) {
  for (i$ in len($runtime)){ 
    if ($i = H) {
      $hours = $i.split({"H"})	  
	}
    if ($i = M) {
      $hours = $i.split({"M"})

	if ($i = S) {
	}
      $seconds = $i.split({"S"})
	}
  }
} elseif ($runtime.Contains("program") {

} else {
   
}

#
# program outline
#

$Payload = @()
$startTime = Get-Date -Uformat %T 
for loop {
$Payload.append(snapshot())
}
$endTime = Get-Date -Uformat %T
$elapsedTime = NEW-TIMESPAN -Start $startTime -End $endTime

#
# Object Structure
#

function snapshot {
  $livecpu = Get-Counter '\Memory\Available MBytes'
  $liveram = Get-Counter '\Processor(_Total)\% Processor Time'
  scan = @(
    ramUsage = [math]::Round(( / )*100,2),
    vramUsage = $,
    cpuUsage = $,
    cpuTemp = $,
    gpuUsage = $,
    gpuTemp = $,
    procList = 
  )
}
$header = @{
  ProgramInfo = @{
    date = $day,
    endTime = $endTime
    startTime = $startTime
    elapsedTime = $elapsedTime
  }
  motherboard = @{
    Manufacturer = $mb.manufacturer,
    SerialNumber = $mb.serialnumber,
    ProductCode = $mb.product
  }
  cpu= @{
    Name = $cpu.name,
    Manufacturer = $cpu.manufacturer,
    SocketDesignation = $cpu.SocketDesignation,
    CurrentClockSpeed = $cpu.CurrentClockSpeed,
    MaxClockSpeed = $cpu.MaxClockSpeed,
    NumberOfCores = $cpu.NumberOfCores, 
    NumberOfEnabledCore = $cpu.NumberOfCores, 
    NumberOfLogicalProcessors = $cpu.NumberOfLogicalProcessors,
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
  memory = @{
    TotalMemory = $ram.,
    Modules = @(
      module = @{
        
        Manufacturer = $,
         = $,
         = $
      }
    )
  }

  videocontroller = @{
     Name = $vc.name,
     Manufacturer = $vc.manufacturer,
     VideoMemory = $vc.adapterram,
     MemoryType = $vc.videomemorytype
  }
  operatingSystem = @{
  
  }
}
