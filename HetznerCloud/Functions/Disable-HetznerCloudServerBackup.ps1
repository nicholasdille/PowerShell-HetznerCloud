function Disable-HetznerCloudServerBackup {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='High')]
    param(
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [int[]]
        $Id
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
            if ($Force -or $PSCmdlet.ShouldProcess("Disable backup for server with ID <$_>?")) {
                Invoke-HetznerCloudApi -Api 'servers' -Method 'Post' -Id $_ -Action 'disable_backup'
            }
        }
    }
}