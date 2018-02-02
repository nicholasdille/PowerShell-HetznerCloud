function Restart-HetznerCloudServer {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='Low')]
    param(
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [int[]]
        $Id
        ,
        [Parameter()]
        [ValidateSet('Reboot', 'Reset')]
        [string]
        $Action = 'Reboot'
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
            Write-Verbose "$Action server with ID <$_>"
            if ($Force -or $PSCmdlet.ShouldProcess("$Action server with ID <$Id>?")) {
                Invoke-HetznerCloudApi -Api 'servers' -Id $_ -Action $Action.ToLower() -Method 'Post'
            }
        }
    }
}