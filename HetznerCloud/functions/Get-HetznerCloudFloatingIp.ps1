function Get-HetznerCloudFloatingIp {
<#
	.SYNOPSIS
		A brief description of the Get-HetznerCloudFloatingIp function.
	
	.DESCRIPTION
		A detailed description of the Get-HetznerCloudFloatingIp function.
	
	.PARAMETER Id
		A description of the Id parameter.
	
	.EXAMPLE
		PS C:\> Get-HetznerCloudFloatingIp
#>
    [CmdletBinding(DefaultParameterSetName='None')]
    param(
        [Parameter(ParameterSetName='ById')]
        [ValidateNotNullOrEmpty()]
        [string]
        $Id
    )

    $Uri = "$($HetznerCloud.Server)/floating_ips"
    if ($PSCmdlet.ParameterSetName -eq 'ById') {
        $Uri += "/$Id"
    }

    $Result = Invoke-RestMethod -Method Get -Uri "$Uri" -Authentication Bearer -Token $HetznerCloud.Token
    
    if ($PSCmdlet.ParameterSetName -eq 'ById') {
        $Result.floating_ip

    } else {
        $Result.floating_ips
    }
}
