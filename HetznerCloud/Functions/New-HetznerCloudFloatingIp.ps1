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
    )

    DynamicParam {
        @(
            @{
                Name = 'Server'
                Type = [string]
                ParameterSetName = 'ByServer'
                Mandatory = $true
                ValidateSet = Get-HetznerCloudServer | Select-Object -ExpandProperty Name
            }

            @{
                Name = 'Location'
                Type = [string]
                ParameterSetName = 'ByLocation'
                Mandatory = $true
                ValidateSet = $script:HetznerCloudLocation | Select-Object -ExpandProperty Name
            }

            @{
                Name = 'Location'
                Type = [string]
                ParameterSetName = 'ByServer'
                Mandatory = $false
                ValidateSet = $script:HetznerCloudLocation | Select-Object -ExpandProperty Name
            }

        ) | ForEach-Object { New-Object PSObject -Property $_ } | New-DynamicParameter
    }

    begin {
        if (-not $PSBoundParameters.ContainsKey('Confirm')) {
            $ConfirmPreference = $PSCmdlet.SessionState.PSVariable.GetValue('ConfirmPreference')
        }
        if (-not $PSBoundParameters.ContainsKey('WhatIf')) {
            $WhatIfPreference = $PSCmdlet.SessionState.PSVariable.GetValue('WhatIfPreference')
        }

        New-DynamicParameter -CreateVariables -BoundParameters $PSBoundParameters
    }

    process {
        $Payload = @{
            type = $Type.ToLower()
        }
        if ($PSBoundParameters.ContainsKey('Server')) {
            $ServerId = Get-HetznerCloudServer -Name $Server | Select-Object -ExpandProperty Id
            $Payload.Add('server', $ServerId)
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