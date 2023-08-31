# Prompt for domain credentials
$credential = Get-Credential

# Join computer to domain
Add-Computer -DomainName "DOMAIN" -Credential $credential 

# Restart computer to apply change
Restart-Computer -Force