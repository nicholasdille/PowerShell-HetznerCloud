function Get-HetznerCloudFloatingIp {
    [CmdletBinding(DefaultParameterSetName='None')]
    param(
        [Parameter(ParameterSetName='ByName')]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name
        ,
        [Parameter(ParameterSetName='ById')]
        [ValidateNotNullOrEmpty()]
        [string]
        $Id
    )

    if ($PSCmdlet.ParameterSetName -ieq 'ByName') {
        Get-HetznerCloudFloatingIp | Where-Object { $_.Name -ieq $Name }

    } else {
        Invoke-HetznerCloudApi -Api 'floating_ips' @PSBoundParameters | ForEach-Object {
            [pscustomobject]@{
                Id = $_.id
                Description = $_.description
                IPAddress = $_.ip
                Type = $_.type
                Server = $_.server
                DnsPtr = $_.dns_ptr
                HomeLocation = $_.home_location.name
                PSTypeName = 'HetznerCloudFloatingIp'
            }
        }
    }
}