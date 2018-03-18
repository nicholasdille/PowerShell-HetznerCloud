function Disable-HetznerCloudServerBackup {
    [CmdletBinding(DefaultParameterSetName='ById', SupportsShouldProcess, ConfirmImpact='High')]
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
        }

        $Id | ForEach-Object {
            $ServerName = Get-HetznerCloudServer -Id $_ | Select-Object -ExpandProperty Name
            Write-Verbose "Disable backup for server <$ServerName>"
            if ($Force -or $PSCmdlet.ShouldProcess("Disable backup for server <$ServerName>?")) {
                Invoke-HetznerCloudApi -Api 'servers' -Method 'Post' -Id $_ -Action 'disable_backup'
            }
        }
    }
}