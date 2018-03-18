function Import-HetznerCloud {
    [CmdletBinding()]
    param()

    $script:HetznerCloudDatacenter = Get-HetznerCloudDatacenter
    $script:HetznerCloudLocation = Get-HetznerCloudLocation
    $script:HetznerCloudServerType = Get-HetznerCloudServerType
    $script:HetznerCloudImage = Get-HetznerCloudImage
    $script:HetznerCloudSshKey = Get-HetznerCloudSshKey
    $script:HetznerCloudIso = Get-HetznerCloudIso
}