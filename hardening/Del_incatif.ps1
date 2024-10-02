$SmtpServer = "smtp.votreserveur.com"
$From = "admin@votredomaine.com"
$To = "vous@votredomaine.com"
$Subject = "Rapport de suppression des comptes expirés"
$Body = @()
$CurrentDate = Get-Date
$ExpiredAccounts = Get-ADUser -Filter {AccountExpirationDate -lt $CurrentDate -and Enabled -eq $true} -Property AccountExpirationDate
$DeletedUsers = @()

foreach ($User in $ExpiredAccounts) {
    try {
        Remove-ADUser -Identity $User.SamAccountName -Confirm:$false
        $DeletedUsers += $User.SamAccountName
    }
    catch {
        $Body += "Échec de la suppression du compte $($User.SamAccountName) : $($_.Exception.Message)"
    }
}

if ($DeletedUsers.Count -gt 0) {
    $Body += "Les comptes suivants ont été supprimés :"
    $Body += $DeletedUsers -join ", "
} else {
    $Body += "Aucun compte expiré n'a été trouvé ou supprimé."
}

$MailParams = @{
    SmtpServer = $SmtpServer
    From       = $From
    To         = $To
    Subject    = $Subject
    Body       = $Body -join "`n"
}

Send-MailMessage @MailParams