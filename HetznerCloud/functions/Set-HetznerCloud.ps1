function Set-HetznerCloud {
<#
	.SYNOPSIS
		A brief description of the Set-HetznerCloud function.
	
	.DESCRIPTION
		A detailed description of the Set-HetznerCloud function.
	
	.PARAMETER Token
		A description of the Token parameter.
	
	.EXAMPLE
		PS C:\> Set-HetznerCloud -Token 'value1'
#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Token
    )

    $HetznerCloud.Token = ConvertTo-SecureString -String $Token -AsPlainText -Force
}
