function Get-HetznerCloudServerMetric {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Id
        ,
        [Parameter(Mandatory)]
        [ValidateSet('CPU', 'Disk', 'Network')]
        [string[]]
        $Type
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Start
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $End
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [int]
        $Interval = 1
    )

    $TypeList = ($Type -join ',').ToLower()
    Invoke-HetznerCloudApi -Api 'servers' -Id $Id -CustomAction "metrics?type=$($TypeList)&start=$($Start)&end=$($End)&step=$($Step)" | Select-Object -ExpandProperty metrics
}