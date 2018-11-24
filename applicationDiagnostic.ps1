#
#command line arguments and parameter passing
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
#info to aggregate
#info: avialble ram, available VRAM, cpu usage, cpu temp, gpu usage, gpu temp 
#

while 
}
$key = Get-Date -Uformat %T
$os = Get-Ciminstance Win32_OperatingSystem
$memoryUsage += $os.FreePhysicalMemory
$vram += 
$delay = 1
$sysinfo = $os.
sleep($delay)
}

#header info
#date, time: start time, end time, elapsed, record delay (seconds), system info: ram, cpu, os, 
$day = Get-Date -Uformat %D 
$endTime = Get-Date -Uformat %T
$elapsedTime = NEW-TIMESPAN -Start $startTime -End $endTime
$videoController = wmic path win32_VideoController get name 
