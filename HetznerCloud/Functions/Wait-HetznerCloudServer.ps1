function Wait-HetznerCloudServer {
    [CmdletBinding(DefaultParameterSetName='None')]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [int]
        $Id
        ,
        [Parameter(Mandatory)]
        [ValidateSet('Running', 'Off')]
        [string]
        $Status
    )

    $CurrentStatus = ''
    while ($CurrentStatus -ne $Status) {
        $CurrentStatus = Get-HetznerCloudServer -Id $Id | Select-Object -ExpandProperty status
        Write-Verbose "CurrentStatus=$CurrentStatus"
        Start-Sleep -Seconds 1
    }
}