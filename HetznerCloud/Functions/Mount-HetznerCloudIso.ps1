function Mount-HetznerCloudIso {
    [CmdletBinding(DefaultParameterSetName='ById', SupportsShouldProcess, ConfirmImpact='Low')]
    param(
        [Parameter(ParameterSetName='ByName')]
        [ValidateNotNullOrEmpty()]
        [string]
        $ServerName
        ,
        [Parameter(ParameterSetName='ById', Mandatory)]
        [ValidateNotNullOrEmpty()]
        [int]
        $ServerId
        ,
        [Parameter(ParameterSetName='ByName', Mandatory)]
        [Parameter(ParameterSetName='ById', Mandatory)]
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
        if ($PSCmdlet.ParameterSetName -ieq 'ByName') {
            $ServerId = Get-HetznerCloudServer -Name $ServerName | Select-Object -ExpandProperty Id
        }

        if ($Force -or $PSCmdlet.ShouldProcess("Mount ISO with ID <$Iso> on server with ID <$ServerId>?")) {
            Invoke-HetznerCloudApi -Api 'servers' -Method 'Post' -Id $ServerId -Action 'attach_iso' -Payload @{
                iso = $Iso
            }
        }
    }
}