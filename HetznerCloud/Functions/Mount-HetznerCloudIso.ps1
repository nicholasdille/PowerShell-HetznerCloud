function Mount-HetznerCloudIso {
    [CmdletBinding(DefaultParameterSetName='ByName', SupportsShouldProcess, ConfirmImpact='Low')]
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

            @{
                Name = 'Iso'
                Type = [string]
                Mandatory = $true
                ValidateSet = $script:HetznerCloudIso | Select-Object -ExpandProperty Name
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
        }

        if ($Force -or $PSCmdlet.ShouldProcess("Mount ISO <$Iso> on server <$Name>?")) {
            $IsoId = Get-HetznerCloudIso | Where-Object { $_.Name -ieq $Iso }
            Invoke-HetznerCloudApi -Api 'servers' -Method 'Post' -Id $Id -Action 'attach_iso' -Payload @{
                iso = $IsoId
            }
        }
    }
}