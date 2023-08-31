# run this command to reset your dns server to default dns Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ResetServerAddresses

# this command changes the ipv4 dns for Ethernet to cloudflare dns you can customize it for your own dns servers 
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses ("1.1.1.1","1.0.0.1")

# this command changes the ipv4 dns for wifi to the cloudflare dns you can customize it for your own dns
Set-DnsClientServerAddress -InterfaceAlias "Wi-fi" -ServerAddresses ("1.1.1.1","1.0.0.1")

