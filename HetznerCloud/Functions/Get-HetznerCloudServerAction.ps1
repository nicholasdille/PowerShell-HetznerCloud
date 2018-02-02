function Get-HetznerCloudServerAction {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [int[]]
        $Id
    )

    process {
        $Id | ForEach-Object {
            Invoke-HetznerCloudApi -Api 'servers' -Id $_ -Action '' | Select-Object -ExpandProperty actions
        }
    }
}