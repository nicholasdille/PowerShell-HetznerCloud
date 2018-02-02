function Start-HetznerCloudServer {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='Low')]
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
            Write-Verbose "Power on server with ID <$_>"
            if ($Force -or $PSCmdlet.ShouldProcess("Power on server with ID <$Id>?")) {
                Invoke-HetznerCloudApi -Api 'servers' -Id $_ -Action 'poweron' -Method 'Post'
            }
        }
    }
}