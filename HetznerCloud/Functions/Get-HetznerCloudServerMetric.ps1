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
    $Data = Invoke-HetznerCloudApi -Api 'servers' -Id $Id -CustomAction "metrics?type=$($TypeList)&start=$($Start)&end=$($End)&step=$($Step)" | Select-Object -ExpandProperty metrics

    $Data | ForEach-Object {
        $Result = [pscustomobject]@{
            Start = $_.start
            End = $_.end
            Steps = $_.step
        }

        if ($Type -contains 'CPU') {
            $Values = $_.time_series.cpu.values | ForEach-Object {
                [pscustomobject]@{
                    Timestamp = $_[0]
                    Value = $_[1]
                }
            }
            Add-Member -InputObject $Result -MemberType NoteProperty -Name Cpu -Value $Values
        }

        if ($Type -contains 'Disk') {
            $Values = $_.time_series.'disk.0.iops.read'.values | ForEach-Object {
                [pscustomobject]@{
                    Timestamp = $_[0]
                    Value = $_[1]
                }
            }
            Add-Member -InputObject $Result -MemberType NoteProperty -Name Disk0IopsRead -Value $Values

            $Values = $_.time_series.'disk.0.iops.write'.values | ForEach-Object {
                [pscustomobject]@{
                    Timestamp = $_[0]
                    Value = $_[1]
                }
            }
            Add-Member -InputObject $Result -MemberType NoteProperty -Name Disk0IopsWrite -Value $Values

            $Values = $_.time_series.'disk.0.bandwidth.read'.values | ForEach-Object {
                [pscustomobject]@{
                    Timestamp = $_[0]
                    Value = $_[1]
                }
            }
            Add-Member -InputObject $Result -MemberType NoteProperty -Name Disk0BandwidthRead -Value $Values

            $Values = $_.time_series.'disk.0.bandwidth.write'.values | ForEach-Object {
                [pscustomobject]@{
                    Timestamp = $_[0]
                    Value = $_[1]
                }
            }
            Add-Member -InputObject $Result -MemberType NoteProperty -Name Disk0BandwidthWrite -Value $Values
        }

        if ($Type -contains 'Network') {
            $Values = $_.time_series.'network.0.pps.in'.values | ForEach-Object {
                [pscustomobject]@{
                    Timestamp = $_[0]
                    Value = $_[1]
                }
            }
            Add-Member -InputObject $Result -MemberType NoteProperty -Name Network0PpsIn -Value $Values

            $Values = $_.time_series.'network.0.pps.out'.values | ForEach-Object {
                [pscustomobject]@{
                    Timestamp = $_[0]
                    Value = $_[1]
                }
            }
            Add-Member -InputObject $Result -MemberType NoteProperty -Name Network0PpsOut -Value $Values

            $Values = $_.time_series.'network.0.bandwidth.in'.values | ForEach-Object {
                [pscustomobject]@{
                    Timestamp = $_[0]
                    Value = $_[1]
                }
            }
            Add-Member -InputObject $Result -MemberType NoteProperty -Name Network0BandwidthIn -Value $Values

            $Values = $_.time_series.'network.0.bandwidth.out'.values | ForEach-Object {
                [pscustomobject]@{
                    Timestamp = $_[0]
                    Value = $_[1]
                }
            }
            Add-Member -InputObject $Result -MemberType NoteProperty -Name Network0BandwidthOut -Value $Values
        }

        $Result
    }
}