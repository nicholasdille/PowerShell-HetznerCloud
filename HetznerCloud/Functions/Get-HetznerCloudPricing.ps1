function Get-HetznerCloudPricing {
    [CmdletBinding()]
    param()

    $Result = Invoke-RestMethod -Method Get -Uri "$($HetznerCloud.Server)/pricing" -Authentication Bearer -Token $HetznerCloud.Token
    $Result.pricing
}