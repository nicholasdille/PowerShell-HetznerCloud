function Get-HetznerCloudSshKey {
<#
	.SYNOPSIS
		A brief description of the Get-HetznerCloudSshKey function.
	
	.DESCRIPTION
		A detailed description of the Get-HetznerCloudSshKey function.
	
	.PARAMETER Name
		A description of the Name parameter.
	
	.PARAMETER Id
		A description of the Id parameter.
	
	.EXAMPLE
		PS C:\> Get-HetznerCloudSshKey
#>
    [CmdletBinding(DefaultParameterSetName='None')]
    param(
        [Parameter(ParameterSetName='ByName')]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name
        ,
        [Parameter(ParameterSetName='ById')]
        [ValidateNotNullOrEmpty()]
        [string]
        $Id
    )

    $Uri = "$($HetznerCloud.Server)/ssh_keys"
    if ($PSCmdlet.ParameterSetName -eq 'ByName') {
        $Uri += "?name=$Name"

    } elseif ($PSCmdlet.ParameterSetName -eq 'ById') {
        $Uri += "/$Id"
    }

    $Result = Invoke-RestMethod -Method Get -Uri "$Uri" -Authentication Bearer -Token $HetznerCloud.Token

    if ($PSCmdlet.ParameterSetName -eq 'ById') {
        $Result.ssh_key

    } else {
        $Result.ssh_keys
    }
}
