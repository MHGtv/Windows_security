# Block Incoming TCP Ports 135, 139, 445
New-NetFirewallRule -DisplayName "Block Port 135" -Direction Inbound -Protocol TCP -LocalPort 135 -Action Block
New-NetFirewallRule -DisplayName "Block Port 139" -Direction Inbound -Protocol TCP -LocalPort 139 -Action Block
New-NetFirewallRule -DisplayName "Block Port 445" -Direction Inbound -Protocol TCP -LocalPort 445 -Action Block

# Block Dynamic RPC Mapper and Endpoint (Ports 49152-65535 for Dynamic RPC)
New-NetFirewallRule -DisplayName "Block Dynamic RPC Ports" -Direction Inbound -Protocol TCP -LocalPort 49152-65535 -Action Block

# Disable IPv6
Set-NetAdapterBinding -Name "*" -ComponentID ms_tcpip6 -Enabled $False

# Disable "Clients for Microsoft Networks"
Set-NetAdapterBinding -Name "*" -ComponentID ms_msclient -Enabled $False
