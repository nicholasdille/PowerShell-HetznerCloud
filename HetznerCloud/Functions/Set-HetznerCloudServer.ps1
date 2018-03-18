function Set-HetznerCloudServer {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='High')]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [int]
        $Id
        ,
        [Parameter(ParameterSetName='SetName', Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name
        ,
        [Parameter(ParameterSetName='SetType', Mandatory)]
        [ValidateSet('cx11', 'cx11-ceph', 'cx21', 'cx21-ceph', 'cx31', 'cx31-ceph', 'cx41', 'cx41-ceph', 'cx51', 'cx51-ceph')]
        [string]
        $Type
        ,
        [Parameter(ParameterSetName='SetType')]
        [switch]
        $AllowDowngrade
        ,
        [Parameter(ParameterSetName='SetDnsPtr', Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $PrimaryIp
        ,
        [Parameter(ParameterSetName='SetDnsPtr')]
        [ValidateNotNullOrEmpty()]
        [string]
        $Hostname = $null
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
        if ($PSCmdlet.ParameterSetName -ieq 'SetName') {
            if ($Force -or $PSCmdlet.ShouldProcess("Change name of server with ID <$Id> to <$Name>?")) {
                Invoke-HetznerCloudApi -Api 'servers' -Method 'Put' -Id $Id -Payload @{
                    name = $Name
                }
            }

        } elseif ($PSCmdlet.ParameterSetName -ieq 'SetType') {
            if ($Force -or $PSCmdlet.ShouldProcess("Change type of server with ID <$Id> to <$Type>?")) {
                Stop-HetznerCloudServer -Id $Id -Action 'Shutdown' -Confirm:$false

                Wait-HetznerCloudServer -Id $Id -Status Off

                $Payload = @{
                    server_type = $Type.ToLower()
                    upgrade_disk = -not $AllowDowngrade
                }
                #if ($AllowDowngrade) {
                #    $Payload.Add('upgrade_disk', -not $AllowDowngrade)
                #}
                Invoke-HetznerCloudApi -Api 'servers' -Method 'Post' -Id $Id -Action 'change_type' -Payload $Payload
            }

        } elseif ($PSCmdlet.ParameterSetName -ieq 'SetDnsPtr') {
            $Payload = @{
                ip = $PrimaryIp
                dns_ptr = $null
            }
            if ($PSBoundParameters.ContainsKey('Hostname')) {
                $Payload['dns_ptr'] = $Hostname
            }
            Invoke-HetznerCloudApi -Api 'servers' -Method 'Post' -Id $Id -Action 'change_dns_ptr' -Payload $Payload
        }
    }
}