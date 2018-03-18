function Disable-HetznerCloudServerRescue {
    [CmdletBinding(DefaultParameterSetName='ById')]
    param(
        [Parameter(ParameterSetName='ById', Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [int[]]
        $Id
    )

    DynamicParam {
        @(
            @{
                Name = 'Name'
                Type = [string]
                ParameterSetName = 'ByName'
                Mandatory = $true
                ValidateSet = Get-HetznerCloudServer | Select-Object -ExpandProperty Name
            }
        ) | ForEach-Object { New-Object PSObject -Property $_ } | New-DynamicParameter
    }

    process {
        New-DynamicParameter -CreateVariables -BoundParameters $PSBoundParameters

        if ($PSCmdlet.ParameterSetName -ieq 'ByName') {
            $Id = Get-HetznerCloudServer -Name $Name | Select-Object -ExpandProperty Id
        }

        $Id | ForEach-Object {
            Invoke-HetznerCloudApi -Api 'servers' -Id $_ -Action 'disable_rescue' -Method 'Post'
        }
    }
}