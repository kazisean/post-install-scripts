# Disable sleep on Windows 11

# Set the power plan to High Performance
$powerPlan = Get-WmiObject -Namespace "Root/CIMv2/Power" -Class Win32_PowerPlan | Where-Object { $_.ElementName -eq "High performance" }
$powerPlan.SetActive()

# Disable sleep timers
powercfg /change standby-timeout-ac 0
powercfg /change standby-timeout-dc 0

Write-Host "Sleep has been disabled."