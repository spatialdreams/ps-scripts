$PSVersionTable.PSVersion

#
#parse command line arguments
#
param (
[string]$desiredRuntime = "default"
  [Parameter(Mandatory=$true)][string]$delay,
  [string]$display = $("true")
)

$startTime = Get-Date -Uformat %T

#info to aggregate:
#ram usage, VRAM usage, cpu usage, cpu temp, gpu usage, gpu temp 
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
$endTime = Get-Date -Uformat %T
$elapsedTime = NEW-TIMESPAN -Start $startTime -End $endTime

#user specific
$motherboard = gwmi win32_baseboard
$videoController = wmic path win32_videocontroller get name 
$processor = Get-Ciminstance -ClassName win32_processor | format-list
$ram = gwmi win32_physicalmemory



#cpu info from ciminstance to gather
#"Name": , "Availability": , "DeviceID": , "AddressWidth": , "DataWidth" , "CurrentClockSpeed": , "MaxClockSpeed": , "Family": , "LoadPercentage": , "UniqueId": , "Architecture": , "AssetTag": , "CpuStatus": "CurrentVoltage": , "ExtClock": , "L2CacheSize": , "L2CacheSpeed":, "L3CacheSize": , "L3CacheSpeed": , "Manufacturer": , "NumberOfCores": , "NumberOfEnabledCore": , "NumberOfLogicalProcessors": , "PartNumber", "ProcessorId": , "SocketDesignation": 

#ram info to gather from RAM
#"BankLabel":

if ($desiredRunTime.Contains("H" -or "M" -or "S")) {
	for { 
	  
	}
	} elseif ($desiredRunTime.Contains("always") {
	
	
#
#header info
#date, time: start time, end time, elapsed, record delay (seconds), system info: ram, cpu, os, 
	$header = @"
	"snapshotInfo":
	  [
	    {
		  "date": $
		  "endTime": $
		  "startTime": $
		  "elapsed": $
		  "SystemInfo": 
		    "cpu":
			  [
			    {
			  
			    }
			  
			  ]
			"memory":
			  [
			    {
				
				}
			  ]
			"motherboard":
			  [
			    {
				
				}
			  ]
			"videocontroller":
			  [
			    {
				
				}
			  ]
		}
	  ]
	  "@
	
for scans in payload:	
	payload":
	[
	  {
	  
	  }
	]
	} elseif ($desitredRunTime.Contains("default") {
	
	} else {
	
}

