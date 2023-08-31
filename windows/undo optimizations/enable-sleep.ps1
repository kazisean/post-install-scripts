# Re-enable sleep on Windows 11

# Set the power plan to Balanced (you might need to adjust the plan name if necessary)
$powerPlan = Get-WmiObject -Namespace "Root/CIMv2/Power" -Class Win32_PowerPlan | Where-Object { $_.ElementName -eq "Balanced" }
$powerPlan.SetActive()

# Restore default sleep timers (you might need to adjust the values based on your preferences)
powercfg /change standby-timeout-ac 15
powercfg /change standby-timeout-dc 30

Write-Host "Sleep has been re-enabled."
