﻿New-ADOrganizationalUnit -Name "Serveurs-DHCP" -Path "DC=dom1,DC=local"
New-ADOrganizationalUnit -Name "Serveurs-DNS" -Path "DC=dom1,DC=local"
New-ADOrganizationalUnit -Name "Serveurs-Fichiers-Home" -Path "DC=dom1,DC=local"
New-ADOrganizationalUnit -Name "Serveurs-Fichiers-Partages" -Path "DC=dom1,DC=local"
New-ADOrganizationalUnit -Name "Serveurs-VPN" -Path "DC=dom1,DC=local"
New-ADOrganizationalUnit -Name "Serveurs-RDP" -Path "DC=dom1,DC=local"
New-ADOrganizationalUnit -Name "Serveurs-Bastion" -Path "DC=dom1,DC=local"
New-ADOrganizationalUnit -Name "Administrateurs" -Path "DC=dom1,DC=local"
New-ADOrganizationalUnit -Name "Utilisateurs" -Path "DC=dom1,DC=local"