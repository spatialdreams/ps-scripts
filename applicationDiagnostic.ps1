#
#parse command line arguments
#
param (
[string]$desiredRuntime = "2m"
  [Parameter(Mandatory=$true)][string]$delay,
  [string]$display = $("true")
)

switch ($desiredRunTime) {
	"H":"M":"S" {
	
	}
	program {
	
	}
	always {
	}
	
}

$startTime = Get-Date -Uformat %T

#info to aggregate:
#ram usage, VRAM usage, cpu usage, cpu temp, gpu usage, gpu temp 
#

while 
}
$key = Get-Date -Uformat %T
$os = Get-Ciminstance Win32_OperatingSystem
$vramUsage += 
$memUsage = [math]::Round(($os.FreePhysicalMemory/$os.TotalVisibleMemorySize)*100,2)
sleep($delay)
}

#header info
#date, time: start time, end time, elapsed, record delay (seconds), system info: ram, cpu, os, 
$day = Get-Date -Uformat %D 
$endTime = Get-Date -Uformat %T
$elapsedTime = NEW-TIMESPAN -Start $startTime -End $endTime
$videoController = wmic path win32_VideoController get name 
$motherboard = gwmi Win32_BaseBoard
$processor = Get-Ciminstance -ClassName Win32_Processor
$ram = gwmi win32_physicalmemory
