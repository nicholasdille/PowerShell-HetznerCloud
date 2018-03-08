function Enable-HetznerCloudServerBackup {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='Low')]
    param(
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [int[]]
        $Id
        ,
        [Parameter(Mandatory)]
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