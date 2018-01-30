function Remove-HetznerCloudSshKey {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [int]
        $Id
    )

    Invoke-HetznerCloudApi -Api 'ssh_keys' -Method 'Delete' @PSBoundParameters
}