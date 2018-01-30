function Remove-HetznerCloudSshKey {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [int[]]
        $Id
    )

    process {
        $Id | ForEach-Object {
            Write-Verbose "Removing SSH public key with ID <$_>"
            Invoke-HetznerCloudApi -Api 'ssh_keys' -Method 'Delete' -Id $_
        }
    }
}