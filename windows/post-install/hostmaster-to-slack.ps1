# Slack webhook URL
$slackWebhookUrl = "ENTER-YOUR-OWN-SLACK-WEBHOOK-HERE"

# Computer name
$computerName = hostname

# Manufacturer
$manufacturer = (Get-WmiObject -Class Win32_ComputerSystem).Manufacturer

# Serial Number
$serialNumber = (Get-WmiObject -Class Win32_BIOS).SerialNumber

# Operating System
$operatingSystem = (Get-WmiObject -Class Win32_OperatingSystem).Caption

# Mac Address
$macAddress = (Get-NetAdapter | Where-Object { $_.PhysicalMediaType -eq '802.3' }).MacAddress -replace '-'

# Computer Model
$computerModel = (Get-WmiObject -Class Win32_ComputerSystem).Model

# RAM
$ram = [math]::Round((Get-WmiObject -Class Win32_ComputerSystem).TotalPhysicalMemory / 1GB, 2)

# Disk Space
$diskSpace = [math]::Round((Get-WmiObject -Class Win32_LogicalDisk | Where-Object { $_.DriveType -eq 3 }).Size / 1GB, 2)

# TeamViewer ID
$teamviewerID = (Get-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\TeamViewer").ClientID

# Create the payload
$payload = @{
    text = @"
Computer name: $computerName
Manufacturer: $manufacturer
Serial Number: $serialNumber
Operating System: $operatingSystem
Mac Address: $macAddress
Computer Model: $computerModel
RAM: $ram GB
Disk Space: $diskSpace GB
Teamviewer ID: $teamviewerID
"@
}

# Convert payload to JSON
$jsonPayload = $payload | ConvertTo-Json

# Send to Slack webhook
$response = Invoke-RestMethod -Method Post -Uri $slackWebhookUrl -Body $jsonPayload -ContentType "application/json"

Write-Host "Host master has been submitted to Slack :)"
