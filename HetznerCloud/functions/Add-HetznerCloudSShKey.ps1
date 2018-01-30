function Add-HetznerCloudSShKey {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $PublicKey
    )

    Invoke-HetznerCloudApi -Api 'ssh_keys' -Method 'Post' -Payload @{
        name = $Name
        public_key = $PublicKey
    }
}