function Remove-HetznerCloudFloatingIp {
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
            Write-Verbose "Removing floating IP with ID <$_>"
            if ($Force -or $PSCmdlet.ShouldProcess("Remove floating IP with ID <$Id>?")) {
                Invoke-HetznerCloudApi -Api 'floating_ips' -Method 'Delete' -Id $_
            }
        }
    }
}