function Disable-HetznerCloudServerRescue {
    [CmdletBinding(DefaultParameterSetName='ById')]
    param(
        [Parameter(ParameterSetName='ByName')]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name
        ,
        [Parameter(ParameterSetName='ById', Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [int[]]
        $Id
    )

    process {
        if ($PSCmdlet.ParameterSetName -ieq 'ByName') {
            $Id = Get-HetznerCloudServer -Name $Name | Select-Object -ExpandProperty Id
        }

        $Id | ForEach-Object {
            Invoke-HetznerCloudApi -Api 'servers' -Id $_ -Action 'disable_rescue' -Method 'Post'
        }
    }
}