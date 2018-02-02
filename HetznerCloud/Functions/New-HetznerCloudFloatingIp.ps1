function New-HetznerCloudFloatingIp {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='Medium')]
    param(
        [Parameter(Mandatory)]
        [ValidateSet('IPv4', 'IPv6')]
        [string]
        $Type
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $Description
        ,
        [Parameter(ParameterSetName='ByServer', Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Server
        ,
        [Parameter(ParameterSetName='ByServer')]
        [Parameter(ParameterSetName='ByLocation', Mandatory)]
        [ValidateSet('fsn1', 'nbg1')]
        [string]
        $Location
    )
    
    begin {
        if (-not $PSBoundParameters.ContainsKey('Confirm')) {
            $ConfirmPreference = $PSCmdlet.SessionState.PSVariable.GetValue('ConfirmPreference')
        }
        if (-not $PSBoundParameters.ContainsKey('WhatIf')) {
            $WhatIfPreference = $PSCmdlet.SessionState.PSVariable.GetValue('WhatIfPreference')
        }
    }

    process {
        $Payload = @{
            type = $Type.ToLower()
        }
        if ($PSBoundParameters.ContainsKey('Server')) {
            $Payload.Add('server', $Server)
        }
        if ($PSBoundParameters.ContainsKey('Location')) {
            $Payload.Add('home_location', $Location)
        }
        if ($PSBoundParameters.ContainsKey('Description')) {
            $Payload.Add('description', $Description)
        }

        if ($Force -or $PSCmdlet.ShouldProcess("Add new floating IP?")) {
            Invoke-HetznerCloudApi -Api 'floating_ips' -Method 'Post' -Payload $Payload
        }
    }
}