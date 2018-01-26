function Get-HetznerCloudPricing {
<#
	.SYNOPSIS
		A brief description of the Get-HetznerCloudPricing function.
	
	.DESCRIPTION
		A detailed description of the Get-HetznerCloudPricing function.
	
	.EXAMPLE
		PS C:\> Get-HetznerCloudPricing
#>
    [CmdletBinding()]
    param()

    $Result = Invoke-RestMethod -Method Get -Uri "$($HetznerCloud.Server)/pricing" -Authentication Bearer -Token $HetznerCloud.Token
    $Result.pricing
}
