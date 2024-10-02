Import-Module ActiveDirectory

$securePassword = -join ((48..57) + (65..90) + (97..122) | Get-Random -Count 16 | ForEach-Object {[char]$_}) | ConvertTo-SecureString -AsPlainText -Force

$krbtgt = Get-ADUser -Filter {SamAccountName -eq "krbtgt"} -Server "dom1.local"

Set-ADAccountPassword -Identity $krbtgt -NewPassword $securePassword -Reset

$plainPassword = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($securePassword))
Write-Host "Mot de passe changé"