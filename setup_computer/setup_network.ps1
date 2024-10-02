$InterfaceName = "Ethernet 2"
$IPAddress = "192.168.21.1"

$Interface = Get-NetAdapter | Where-Object { $_.Name -eq $InterfaceName }

if ($Interface) {
    New-NetIPAddress -InterfaceIndex $Interface.ifIndex -IPAddress $IPAddress -PrefixLength 24
} else {
    Write-Host "Interface de réseau '$InterfaceName' non trouvée."
}