#Install-Module -Name "PnP.PowerShell"
#Reference https://pnp.github.io/powershell/articles/azurefunctions.html
$adminsite = "https://tenant-admin.sharepoint.com"
$password = ConvertTo-SecureString -String "password" -AsPlainText -Force
Register-PnPAzureADApp -ApplicationName "PnPPowerShell" -Tenant DefaultDomain.com -Interactive
