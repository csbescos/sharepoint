#Don't include these secrets in production.
$TenantID = 'x'
$ApplicationId = "x"
$ApplicationSecret = "x"
  
$body = @{
    'resource'      = 'https://graph.microsoft.com'
    'client_id'     = $ApplicationId
    'client_secret' = $ApplicationSecret
    'grant_type'    = "client_credentials"
    'scope'         = "openid"
}
 
$ClientToken = Invoke-RestMethod -Method post -Uri "https://login.microsoftonline.com/$($tenantid)/oauth2/token" -Body $body -ErrorAction Stop
$headers = @{ "Authorization" = "Bearer $($ClientToken.access_token)" }

$sites = (Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/sites?search=*" -Headers $Headers -Method Get -ContentType "application/json")

$urls = $sites.value.weburl

foreach($url in $urls){
    Connect-PnPOnline -ClientId $applicationid -Url $url -Tenant $tenantid -CertificatePath '.\PnPPowerShell.pfx'
    Set-PnPList -BreakRoleInheritance -Identity Documents
}
