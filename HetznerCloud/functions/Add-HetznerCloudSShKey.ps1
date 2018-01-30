function Add-HetznerCloudSShKey {
<#
	.SYNOPSIS
		A brief description of the Add-HetznerCloudSShKey function.
	
	.DESCRIPTION
		A detailed description of the Add-HetznerCloudSShKey function.
	
	.PARAMETER Name
		A description of the Name parameter.
	
	.PARAMETER PublicKey
		A description of the PublicKey parameter.
	
	.EXAMPLE
		PS C:\> Add-HetznerCloudSShKey -Name 'value1' -PublicKey 'value2'
#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
		$Name,
		
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $PublicKey
    )

    $Payload = @{
        name = $Name
        public_key = $PublicKey
    } | ConvertTo-Json

    try {
        $Result = Invoke-RestMethod -Method Post -Uri "$($HetznerCloud.Server)/ssh_keys" -Authentication Bearer -Token $HetznerCloud.Token -ContentType 'application/json' -Body $Payload
        $Result.ssh_key

    } catch {
        $Code = [int]$_.Exception.Response.StatusCode
        $Reason = $_.Exception.Response.ReasonPhrase
        $Json = $_.ErrorDetails.Message | ConvertFrom-Json
        $Message = $Json.error.Message
        Write-Error "Received $Code ($Reason): $Message"
    }
}
