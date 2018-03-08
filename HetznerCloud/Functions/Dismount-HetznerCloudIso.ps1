function Dismount-HetznerCloudIso {
    [CmdletBinding(DefaultParameterSetName='ById', SupportsShouldProcess, ConfirmImpact='Medium')]
    param(
        [Parameter(ParameterSetName='ByName')]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name
        ,
        [Parameter(ParameterSetName='ById', Mandatory)]
        [ValidateNotNullOrEmpty()]
        [int]
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
        if ($PSCmdlet.ParameterSetName -ieq 'ByName') {
            $Id = Get-HetznerCloudServer -Name $Name | Select-Object -ExpandProperty Id
        }

        if ($Force -or $PSCmdlet.ShouldProcess("Unmount ISO from server with ID <$Id>?")) {
            Invoke-HetznerCloudApi -Api 'servers' -Method 'Post' -Id $Id -Action 'detach_iso'
        }
    }
}