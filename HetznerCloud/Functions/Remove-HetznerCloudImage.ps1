function Remove-HetznerCloudImage {
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
                ValidateSet = Get-HetznerCloudImage | Select-Object -ExpandProperty Name
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
            $Id = Get-HetznerCloudImage | Where-Object { $_.Name -ieq $Name } | Select-Object -ExpandProperty Id
        }

        $Id | ForEach-Object {
            $Name = Get-HetznerCloudImage -Id $_ | Select-Object -ExpandProperty Name
            Write-Verbose "Removing image <$Name>"
            if ($Force -or $PSCmdlet.ShouldProcess("Remove image <$Name>?")) {
                Invoke-HetznerCloudApi -Api 'images' -Id $_ -Method 'Delete'
            }
        }
    }
}