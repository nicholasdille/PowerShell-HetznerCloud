function Get-HetznerCloudServerMetric {
    [CmdletBinding(DefaultParameterSetName='ById')]
    param(
        [Parameter(ParameterSetName='ByName')]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name
        ,
        [Parameter(ParameterSetName='ById', Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Id
        ,
        [Parameter(ParameterSetName='ByName', Mandatory)]
        [Parameter(ParameterSetName='ById', Mandatory)]
        [ValidateSet('CPU', 'Disk', 'Network')]
        [string[]]
        $Type
        ,
        [Parameter(ParameterSetName='ByName', Mandatory)]
        [Parameter(ParameterSetName='ById', Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Start
        ,
        [Parameter(ParameterSetName='ByName', Mandatory)]
        [Parameter(ParameterSetName='ById', Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $End
        ,
        [Parameter(ParameterSetName='ByName')]
        [Parameter(ParameterSetName='ById')]
        [ValidateNotNullOrEmpty()]
        [int]
        $Interval = 1
    )


    if ($PSCmdlet.ParameterSetName -ieq 'ByName') {
        $Id = Get-HetznerCloudServer -Name $Name | Select-Object -ExpandProperty Id
    }

    $TypeList = ($Type -join ',').ToLower()
    Invoke-HetznerCloudApi -Api 'servers' -Id $Id -CustomAction "metrics?type=$($TypeList)&start=$($Start)&end=$($End)&step=$($Step)" | Select-Object -ExpandProperty metrics
}