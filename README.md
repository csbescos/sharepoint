# SharePoint Default Document Library Permissions
The objective of this project is to get all sites in a Microsoft 365 tenant and remove permissions for all users to the default document library of each site. 
This is useful when using Microsoft 365 groups but do not want to leverage the documents portion of the site. 

## Setup
The setup to run this headless uses certificate based authentication. 
We require the PNP.Powershell module to execute the script.  Please find documentation on the module and commands at the PNP site https://docs.microsoft.com/en-us/powershell/sharepoint/sharepoint-pnp/sharepoint-pnp-cmdlets.  (Community supported microsoft module)

To setup the Azure AD application you will need the following:
1. PNP Module - You can install with this command ```Install-Module -Name "PnP.PowerShell"```
2. A AzureAD application registration.  You can create one by running:
```
$password = ConvertTo-SecureString -String "password" -AsPlainText -Force
Register-PnPAzureADApp -ApplicationName "PnPPowerShell" -Tenant DefaultDomain.com -Interactive
```
3. Document the application ID and the generated PFX file for future use.  
4. Once the application is created create an application secret. https://docs.microsoft.com/en-us/azure/active-directory/develop/howto-create-service-principal-portal#option-2-create-a-new-application-secret


## Execution
Now that you have the application id, secret, tenant id, and certificates you are ready to proceed with the next step. 
1. [Fill in the key secrets and run the Break-Site-Permissions](/break-Site-Permissions.ps1)
2. Convert this to an [Azure Function](https://pnp.github.io/powershell/articles/azurefunctions.html)

