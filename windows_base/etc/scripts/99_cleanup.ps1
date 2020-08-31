Dism /Online /Cleanup-Image /startcomponentcleanup
Dism /Online /Cleanup-Image /CheckHealth
Dism /Online /Cleanup-Image /scanHealth

######if problem#######
DISM /Online /Cleanup-Image /RestoreHealth

#############################clear event logs
Clear-EventLog -LogName (GEt-EventLog -List).log

#####defrag drive
defrag /U /V c: