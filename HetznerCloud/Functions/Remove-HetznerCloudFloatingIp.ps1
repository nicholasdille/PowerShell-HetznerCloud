function Remove-HetznerCloudFloatingIp {
    [CmdletBinding(DefaultParameterSetName='ByName', SupportsShouldProcess, ConfirmImpact='High')]
    param(
        [Parameter(ParameterSetName='ById', Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [int[]]
        $Id
    )

    DynamicParam {
        @(
            @{
                Name = 'Name'
                Type = [string]
                ParameterSetName = 'ByName'
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

        if ($PSCmdlet.ParameterSetName -ieq 'ByName') {
            $Id = Get-HetznerCloudFloatingIp | Where-Object { $_.Name -ieq $Name } | Select-Object -ExpandProperty Id
        }

        $Id | ForEach-Object {
            $Name = Get-HetznerCloudFloatingIp -Id $_ | Select-Object -ExpandProperty Name
            Write-Verbose "Removing floating IP <$Name>"
            if ($Force -or $PSCmdlet.ShouldProcess("Remove floating IP <$Name>?")) {
                Invoke-HetznerCloudApi -Api 'floating_ips' -Method 'Delete' -Id $_
            }
        }
    }
}