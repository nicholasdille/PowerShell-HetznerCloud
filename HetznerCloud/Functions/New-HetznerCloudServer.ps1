function New-HetznerCloudServer {
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
        $Type
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Image
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [int[]]
        $SshKey
        ,
        [Parameter()]
        [switch]
        $NoStartAfterCreate
    )

    Invoke-HetznerCloudApi -Api 'servers' -Method 'Post' -Payload @{
        name = $Name
        server_type = $Type
        image = $Image
        ssh_keys = $SshKey
        #start_after_create = -not $StartAfterCreate
    }
}