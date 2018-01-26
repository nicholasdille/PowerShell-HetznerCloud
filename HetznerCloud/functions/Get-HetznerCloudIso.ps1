function Get-HetznerCloudIso {
<#
	.SYNOPSIS
		A brief description of the Get-HetznerCloudIso function.
	
	.DESCRIPTION
		A detailed description of the Get-HetznerCloudIso function.
	
	.PARAMETER Name
		A description of the Name parameter.
	
	.PARAMETER Id
		A description of the Id parameter.
	
	.EXAMPLE
		PS C:\> Get-HetznerCloudIso
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

    $Uri = "$($HetznerCloud.Server)/isos"
    if ($PSCmdlet.ParameterSetName -eq 'ByName') {
        $Uri += "?name=$Name"

    } elseif ($PSCmdlet.ParameterSetName -eq 'ById') {
        $Uri += "/$Id"
    }

    $Result = Invoke-RestMethod -Method Get -Uri "$Uri" -Authentication Bearer -Token $HetznerCloud.Token
    
    if ($PSCmdlet.ParameterSetName -eq 'ById') {
        $Result.iso

    } else {
        $Result.isos
    }
}
