# ps-scripts
A directory for windows powershell scripts

## Application diagnostic
system info with powershell. [Unstable]
###TODO:
  add live vram, gpu, and temp info to snapshots,
  change the get-process command so it returns program level hardware usage information,
  add conditional to end snapshot loop after the program name provided by the -program argument is missing from the proclist,
  add an excel friendly csv output with graphs and shyt because Windows.
###BUG:
  ram usage is returning negative infinity.
