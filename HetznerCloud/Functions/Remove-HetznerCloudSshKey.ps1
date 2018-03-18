function Remove-HetznerCloudSshKey {
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
                ValidateSet = Get-HetznerCloudSshKey | Select-Object -ExpandProperty Name
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
            $Id = Get-HetznerCloudSshKey | Where-Object { $_.Name -ieq $Name } | Select-Object -ExpandProperty Id
        }

        $Id | ForEach-Object {
            $Name = Get-HetznerCloudSshKey -Id $_ | Select-Object -ExpandProperty Name
            Write-Verbose "Removing SSH public key <$Name>"
            if ($Force -or $PSCmdlet.ShouldProcess("Remove SSH public key <$Name>?")) {
                Invoke-HetznerCloudApi -Api 'ssh_keys' -Method 'Delete' -Id $_
            }
        }
    }
}