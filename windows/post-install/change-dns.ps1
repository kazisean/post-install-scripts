# define your dns servers below in between the quotes. Running this script as it is will change your ethernet connection DNS to cloudflare dns 
$dnsServers = "1.1.1.1", "1.0.0.1"

# Get all Ethernet network adapters
$ethernetAdapters = Get-NetAdapter | Where-Object { $_.InterfaceDescription -like "*Ethernet*" }

foreach ($adapter in $ethernetAdapters) {
    # Check if the adapter is connected
    if ($adapter.Status -eq "Up") {
        # Configure DNS settings
        $adapter | Set-DnsClientServerAddress -ServerAddresses $dnsServers
        Write-Host "DNS settings updated for Ethernet adapter $($adapter.Name)"
    } else {
        Write-Host "Ethernet adapter $($adapter.Name) is not connected, skipping..."
    }
}

# Print out the current DNS after switch
$ipconfigOutput = ipconfig /all

$dnsLines = $ipconfigOutput | Select-String -Pattern "DNS Servers"

$ipv4DnsLines = $dnsLines | Where-Object { $_.Line -match "IPv4 Address" }

if ($ipv4DnsLines) {
    Write-Host "IPv4 DNS Servers for Ethernet:"
    foreach ($line in $ipv4DnsLines) {
        $dnsServer = $line.Line -replace ".*: ", ""
        Write-Host "  $dnsServer"
    }
} else {
    Write-Host "No IPv4 DNS servers found for Ethernet most likely because computer is using ipv6 DNS servers"
}