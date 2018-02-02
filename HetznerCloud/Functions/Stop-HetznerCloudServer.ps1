function Stop-HetznerCloudServer {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='High')]
    param(
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [int[]]
        $Id
        ,
        [Parameter()]
        [ValidateSet('Shutdown', 'PowerOff')]
        [string]
        $Action = 'Shutdown'
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