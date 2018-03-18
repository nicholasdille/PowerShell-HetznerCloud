function Get-HetznerCloudServer {
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
        Get-HetznerCloudServer | Where-Object { $_.Name -ieq $Name }

    } else {
        $FloatingIps = Get-HetznerCloudFloatingIp
        Invoke-HetznerCloudApi -Api 'servers' @PSBoundParameters | ForEach-Object {
            [pscustomobject]@{
                Id = $_.id
                Name = $_.name
                Status = $_.status
                Created = $_.created
                Type = $_.server_type.name
                Datacenter = $_.datacenter.name
                Location = $_.datacenter.location.name
                Image = $_.image.name
                IPAddress = $_.public_net.ipv4.ip
                DnsPtr = $_.public_net.ipv4.dns_ptr
                FloatingIp = foreach ($FloatingIpId in $_.public_net.floating_ips) {
                    $FloatingIps |
                        Where-Object { $_.Id -eq $FloatingIpId } |
                        Select-Object -ExpandProperty IPAddress
                }
                Iso = ''
                Backup = $_.backup_window
                RescueSystem = $_.rescue_enabled
                'PSTypeName' = 'HetznerCloudServer'
            }
        }
    }
}