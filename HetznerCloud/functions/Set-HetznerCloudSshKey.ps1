function Set-HetznerCloudSshKey {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [int]
        $Id
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name
    )

    Invoke-HetznerCloudApi -Api 'ssh_keys' -Method 'Put' -Id $Id -Payload @{
        name = $Name
    }
}