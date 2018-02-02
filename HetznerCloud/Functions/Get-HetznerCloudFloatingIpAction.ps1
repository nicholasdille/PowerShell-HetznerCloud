function Get-HetznerCloudFloatingIpAction {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [int[]]
        $Id
    )

    process {
        $Id | ForEach-Object {
            Invoke-HetznerCloudApi -Api 'floating_ips' -Id $_ -CustomAction 'actions' | Select-Object -ExpandProperty actions
        }
    }
}