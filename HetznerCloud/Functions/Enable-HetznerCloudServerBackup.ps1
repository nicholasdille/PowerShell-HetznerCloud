function Enable-HetznerCloudServerBackup {
    [CmdletBinding(DefaultParameterSetName='ById', SupportsShouldProcess, ConfirmImpact='Low')]
    param(
        [Parameter(ParameterSetName='ByName')]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name
        ,
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

    begin {
        if (-not $PSBoundParameters.ContainsKey('Confirm')) {
            $ConfirmPreference = $PSCmdlet.SessionState.PSVariable.GetValue('ConfirmPreference')
        }
        if (-not $PSBoundParameters.ContainsKey('WhatIf')) {
            $WhatIfPreference = $PSCmdlet.SessionState.PSVariable.GetValue('WhatIfPreference')
        }
    }

    process {
        if ($PSCmdlet.ParameterSetName -ieq 'ByName') {
            $Id = Get-HetznerCloudServer -Name $Name | Select-Object -ExpandProperty Id
        }

        $Id | ForEach-Object {
            Write-Verbose "Disable backup for server with ID <$_>"
            if ($Force -or $PSCmdlet.ShouldProcess("Enable backup for server with ID <$_>?")) {
                $Payload = @{
                    'backup_window' = $Timeslot
                }
                Invoke-HetznerCloudApi -Api 'servers' -Method 'Post' -Id $_ -Action 'enable_backup' -Payload $Payload
            }
        }
    }
}