#
#parse command line arguments
#
Param (
  [string]$runtime,
  [Parameter(Mandatory=$true)][Int32]$delay,
  [string]$program,
  [string]$csv = "false"
)

if( $runtime = '') {
	$runtime = @(0,4,0)
}


#get system info
$bios = gwmi win32_bios
$mb = gwmi win32_baseboard
$vc = gwmi win32_videocontroller 
$ram = gwmi win32_physicalmemory
$cpu = gwmi win32_processor 
$os = gwmi win32_operatingsystem
$banks = @()
foreach ( $module in $ram ) {
  $bank = @{
    Manufacturer = $module.manufacturer;
    Speed = $module.speed;
    Capacity = $module.Capacity;
    PartNumber = $module.PartNumber;
    SerialNumber = $module.SerialNumber;  
  }
  $banks += $bank
}






#} else {
#   throw "the -runtime switch format is ..." #add the format
#}

#
# Object Structure
#
$header = @{
  ProgramInfo = @{
    date = Get-Date -Uformat %D;
    endTime = $endTime;
    startTime = $startTime;
    elapsedTime = $elapsedTime;
	psversion = $PSVersionTable.PSVersion;
  }
  baseboard = @{
    Manufacturer = $mb.manufacturer;
    SerialNumber = $mb.serialnumber;
    ProductCode = $mb.product;
  }
  cpu = @{
    Name = $cpu.name;
    Manufacturer = $cpu.manufacturer;
    SocketDesignation = $cpu.SocketDesignation;
    CurrentClockSpeed = $cpu.CurrentClockSpeed;
    MaxClockSpeed = $cpu.MaxClockSpeed;
    NumberOfCores = $cpu.NumberOfCores; 
    NumberOfEnabledCore = $cpu.NumberOfCores; 
    NumberOfLogicalProcessors = $cpu.NumberOfLogicalProcessors;
    L2CacheSize = $cpu.l2cachesize; 
    L2CacheSpeed = $cpu.L2CacheSpeed; 
    L3CacheSize = $cpu.L3CacheSize; 
    L3CacheSpeed = $cpu.L3CacheSpeed; 
    Architecture = $cpu.Architecture;
    Family = $cpu.Family;
    ExtClock = $cpu.extfamily;
    DeviceID = $cpu.deviceid;
    UniqueId = $cpu.uniqueid;
  }
  memory = @{
    TotalMemory = $ram | Measure-Object -Property capacity -Sum | select sum
	Banks = $banks
  }

  videocontroller = @{
     Name = $vc.name;
     Manufacturer = $vc.manufacturer;
     VideoMemory = $vc.adapterram;
     MemoryType = $vc.videomemorytype;
	 InstalledDisplayDrivers = $InstalledDisplayDrivers;
  }
  operatingSystem = @{
    SystemDirectory  = $os.SystemDirectory;
    Organization = $os.Organization;
    BuildNumber = $os.BuildNumber;
    RegisteredUser = $os.RegisteredUser;
    SerialNumber = $os.SerialNumber;
    Version = $os.Version
  }
  bios = @{
    Name = $bios.Name;
    Version = $bios.Version;
    SMBIOSBIOSVersion = $bios.SMBIOSBIOSVersion;
    Manufacturer = $bios.Manufacturer;
    SerialNumber = $bios.SerialNumber;
  }
}


#
# program outline
#
function snapshot() {
  $liveram = Get-Counter '\Memory\Available Bytes'
  $livecpu = Get-Counter '\Processor(_Total)\% Processor Time'
  $scan = @{
    cpuUsage =  $livecpu.countersamples.cookedvalue;
    ramUsage = 100 - ( $liveram.countersamples.cookedvalue / $header.totalmemory.sum ) * 100 / 2;
    #vramUsage = $;
    #cpuTemp = $;
    #gpuUsage = $;
    #gpuTemp = $;
    procList = get-process;
  }
  return $scan
}

function Main() {
  $payload = @()
  $startTime = [DateTime]::Now
  $endTime = $startTime.Add(1).AddHours($runtime[0]).AddMinutes($runtime[1]).AddSeconds($runtime[2])
  while ([DateTime]::Now -lt $endTime) {
    $scantime = Measure-Command { $payload += snapshot } | Select-Object TotalSeconds
    sleep($delay-$scantime)
  }
  $runTime = Get-Date -Uformat %T
  $elapsedTime = NEW-TIMESPAN -Start $startTime -End $endTime
  $times = @($startTime, $endTime, $elapsedTime)
  $output = @{
  	  header = $header
	  payload = $payload
	  times = $times
  }
  return $output
}

Main
