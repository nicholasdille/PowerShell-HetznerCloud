function Mount-HetznerCloudIso {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='Low')]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [int]
        $Server
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [int]
        $Iso
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
        if ($Force -or $PSCmdlet.ShouldProcess("Mount ISO with ID <$Iso> on server with ID <$Server>?")) {
            Invoke-HetznerCloudApi -Api 'servers' -Method 'Post' -Id $Server -Action 'attach_iso' -Payload @{
                iso = $Iso
            }
        }
    }
}