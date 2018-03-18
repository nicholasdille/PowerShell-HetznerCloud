function Register-HetznerCloudFloatingIp {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='High')]
    param()

    DynamicParam {
        @(
            @{
                Name = 'Server'
                Type = [string]
                Mandatory = $true
                ValidateSet = Get-HetznerCloudServer | Select-Object -ExpandProperty Name
            }

            @{
                Name = 'FloatingIp'
                Type = [string]
                Mandatory = $true
                ValidateSet = Get-HetznerCloudFloatingIp | Select-Object -ExpandProperty IPAddress
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
    }

    process {
        New-DynamicParameter -CreateVariables -BoundParameters $PSBoundParameters

        if ($Force -or $PSCmdlet.ShouldProcess("Assign floating IP <$FloatingIp> to server <$Server>?")) {
            $Id = Get-HetznerCloudFloatingIp | Where-Object { $_.IPAddress -eq $FloatingIp } | Select-Object -ExpandProperty Id
            $ServerId = Get-HetznerCloudServer -Name $Server | Select-Object -ExpandProperty Id
            Invoke-HetznerCloudApi -Api 'floating_ips' -Method 'Post' -Id $Id -Action 'assign' -Payload @{
                server = $ServerId
            }
        }
    }
}