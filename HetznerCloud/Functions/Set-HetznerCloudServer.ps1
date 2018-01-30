function Set-HetznerCloudServer {
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

    Invoke-HetznerCloudApi -Api 'servers' -Method 'Put' -Id $Id -Payload @{
        name = $Name
    }
}