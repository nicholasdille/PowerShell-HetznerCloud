function Set-HetznerCloudFloatingIp {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='Low')]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [int]
        $Id
        ,
        [Parameter(ParameterSetName='SetDescription', Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Description
        ,
        [Parameter(ParameterSetName='SetDnsPtr', Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $IPAddress
        ,
        [Parameter(ParameterSetName='SetDnsPtr')]
        [ValidateNotNullOrEmpty()]
        [string]
        $Hostname
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
        if ($PSCmdlet.ParameterSetName -ieq 'SetDescription') {
            if ($Force -or $PSCmdlet.ShouldProcess("Change description of floating IP with ID <$Id> to <$Description>?")) {
                Invoke-HetznerCloudApi -Api 'floating_ips' -Method 'Put' -Id $Id -Payload @{
                    description = $Description
                }
            }

        } elseif ($PSCmdlet.ParameterSetName -ieq 'SetDnsPtr') {
            if ($Force -or $PSCmdlet.ShouldProcess("Change DNS PTR of floating IP <$IPAddress> to <$Hostname>?")) {
                $Payload = @{
                    ip = $IPAddress
                    dns_ptr = $null
                }
                if ($PSBoundParameters.ContainsKey('Hostname')) {
                    $Payload['dns_ptr'] = $Hostname
                }
                Invoke-HetznerCloudApi -Api 'floating_ips' -Method 'Post' -Id $Id -Action 'change_dns_ptr' -Payload $Payload
            }
        }
    }
}