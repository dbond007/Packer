#######disable drive optimisation
If ((Get-ScheduledTask -TaskName 'ScheduledDefrag').State -eq 'Ready') 
{
    Disable-ScheduledTask -TaskName 'ScheduledDefrag' -TaskPath '\Microsoft\Windows\Defrag'
}
Get-ScheduledTask -TaskName 'ScheduledDefrag'