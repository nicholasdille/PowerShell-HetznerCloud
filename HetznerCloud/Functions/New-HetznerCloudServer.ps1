function New-HetznerCloudServer {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name
        ,
        [Parameter(Mandatory)]
        [ValidateSet('cx11', 'cx11-ceph', 'cx21', 'cx21-ceph', 'cx31', 'cx31-ceph', 'cx41', 'cx41-ceph', 'cx51', 'cx51-ceph')]
        [string]
        $Type
        ,
        [Parameter(Mandatory)]
        [ValidateSet('ubuntu-16.04', 'debian-9', 'centos-7', 'fedora-27')]
        [string]
        $Image
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [int[]]
        $SshKey
        ,
        [Parameter(ParameterSetName='ByDatacenter')]
        [ValidateSet('fsn1-dc8', 'nbg1-dc3')]
        [string]
        $Datacenter
        ,
        [Parameter(ParameterSetName='ByLocation')]
        [ValidateSet('fsn1', 'nbg1')]
        [string]
        $Location
        ,
        [Parameter()]
        [switch]
        $NoStartAfterCreate
    )

    $Payload = @{
        name = $Name
        server_type = $Type
        image = $Image
        ssh_keys = $SshKey
    }
    if ($PSBoundParameters.ContainsKey('NoStartAfterCreate')) {
        $Payload.Add('start_after_create', $false)
    }
    if ($PSBoundParameters.ContainsKey('Datacenter')) {
        $Payload.Add('datacenter', $Datacenter)
    }
    if ($PSBoundParameters.ContainsKey('Location')) {
        $Payload.Add('location', $Location)
    }

    Invoke-HetznerCloudApi -Api 'servers' -Method 'Post' -Payload $Payload
}