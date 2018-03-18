function Dismount-HetznerCloudIso {
    [CmdletBinding(DefaultParameterSetName='ByName', SupportsShouldProcess, ConfirmImpact='Medium')]
    param(
        [Parameter(ParameterSetName='ById', Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [int]
        $Id
    )

    DynamicParam {
        @(
            @{
                Name = 'Name'
                Type = [string]
                ParameterSetName = 'ByName'
                Mandatory = $true
                ValidateSet = Get-HetznerCloudServer | Select-Object -ExpandProperty Name
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
            $Id = Get-HetznerCloudServer -Name $Name | Select-Object -ExpandProperty Id

        } elseif ($PSCmdlet.ParameterSetName -ieq 'ById') {
            $Name = Get-HetznerCloudServer -Name $Id | Select-Object -ExpandProperty Name
        }

        if ($Force -or $PSCmdlet.ShouldProcess("Unmount ISO from server <$Name>?")) {
            Invoke-HetznerCloudApi -Api 'servers' -Method 'Post' -Id $Id -Action 'detach_iso'
        }
    }
}