function New-HetznerCloudImage {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='Medium')]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [int]
        $Id
        ,
        [Parameter()]
        [ValidateSet('Snapshot', 'Backup')]
        [string]
        $Type = 'Snapshot'
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $Description
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
        $Payload = @{
            type = $Type.ToLower()
        }
        if ($PSBoundParameters.ContainsKey('Description')) {
            $Payload.Add('description', $Description)
        }

        if ($Force -or $PSCmdlet.ShouldProcess("Create a new image from server with ID '$Id'?")) {
            Invoke-HetznerCloudApi -Api 'servers' -Id $Id -Action 'create_image' -Method 'Post' -Payload $Payload
        }
    }
}