function Enable-HetznerCloudServerBackup {
    [CmdletBinding(DefaultParameterSetName='ById', SupportsShouldProcess, ConfirmImpact='Low')]
    param(
        [Parameter(ParameterSetName='ById', Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [int[]]
        $Id
        ,
        [Parameter(ParameterSetName='ByName', Mandatory)]
        [Parameter(ParameterSetName='ById', Mandatory)]
        [ValidateSet('22-02', '02-06', '06-10', '10-14', '14-18', '18-22')]
        [string]
        $Timeslot
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
            if ($Force -or $PSCmdlet.ShouldProcess("Enable backup for server <$ServerName>?")) {
                $Payload = @{
                    'backup_window' = $Timeslot
                }
                Invoke-HetznerCloudApi -Api 'servers' -Method 'Post' -Id $_ -Action 'enable_backup' -Payload $Payload
            }
        }
    }
}