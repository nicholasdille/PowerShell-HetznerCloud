function Enable-HetznerCloudServerBackup {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='Low')]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [int]
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
        if ($Force -or $PSCmdlet.ShouldProcess("Enable backup for server with ID <$Id>?")) {
            $Payload = @{
                'backup_window' = $Timeslot
            }
            Invoke-HetznerCloudApi -Api 'servers' -Method 'Post' -Id $Id -Action 'enable_backup' -Payload $Payload
        }
    }
}