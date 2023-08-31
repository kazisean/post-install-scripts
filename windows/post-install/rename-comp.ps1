# Prompt user for new computer name
$newName = Read-Host "Enter the new computer name"

# Rename computer and restart
Rename-Computer -NewName $newName Restart-Computer -Force