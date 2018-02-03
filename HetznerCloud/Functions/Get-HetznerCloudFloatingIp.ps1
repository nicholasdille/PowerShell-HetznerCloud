function Get-HetznerCloudFloatingIp {
    [CmdletBinding(DefaultParameterSetName='None')]
    param(
        [Parameter(ParameterSetName='ById')]
        [ValidateNotNullOrEmpty()]
        [string]
        $Id
    )

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