function Remove-HetznerCloudServer {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [int[]]
        $Id
    )

    process {
        $Id | ForEach-Object {
            Write-Verbose "Removing server with ID <$_>"
            Invoke-HetznerCloudApi -Api 'servers' -Id $_ -Method 'Delete'
        }
    }
}