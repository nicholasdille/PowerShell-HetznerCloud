function New-HetznerCloudImage {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='Medium')]
    param(
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

    DynamicParam {
        @(
            @{
                Name = 'Server'
                Type = [string]
                Mandatory = $true
                ValidateSet = Get-HetznerCloudServer | Select-Object -ExpandProperty Name
            }
        ) | ForEach-Object { New-Object PSObject -Property $_ } | New-DynamicParameter
    }

    begin {
        if (-not $PSBoundParameters.ContainsKey('Confirm')) {
            $ConfirmPreference = $PSCmdlet.SessionState.PSVariable.GetValue('ConfirmPreference')
        }
        if (-not $PSBoundParameters.ContainsKey('WhatIf')) {
            $WhatIfPreference = $PSCmdlet.SessionState.PSVariable.GetValue('WhatIfPreference')
        }

        New-DynamicParameter -CreateVariables -BoundParameters $PSBoundParameters
    }

    process {
        $Payload = @{
            type = $Type.ToLower()
        }
        if ($PSBoundParameters.ContainsKey('Description')) {
            $Payload.Add('description', $Description)
        }

        if ($Force -or $PSCmdlet.ShouldProcess("Create a new image from server '$Server'?")) {
            $Id = Get-HetznerCloudServer | Where-Object { $_.Name -ieq $Server } | Select-Object -ExpandProperty Id
            Invoke-HetznerCloudApi -Api 'servers' -Id $Id -Action 'create_image' -Method 'Post' -Payload $Payload
        }
    }
}