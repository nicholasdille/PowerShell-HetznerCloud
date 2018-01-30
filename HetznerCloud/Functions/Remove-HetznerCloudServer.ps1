function Remove-HetznerCloudServer {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [int]
        $Id
    )

    Invoke-HetznerCloudApi -Api 'servers' -Id $Id -Method 'Delete'
}