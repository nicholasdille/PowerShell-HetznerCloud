function Enable-HetznerCloudServerRescue {
    [CmdletBinding()]
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
        ,
        [Parameter(ParameterSetName='ByName')]
        [Parameter(ParameterSetName='ById')]
        [ValidateSet('linux64', 'linux32', 'freebsd64')]
        [string]
        $Type = 'linux64'
        ,
        [Parameter(ParameterSetName='ByName')]
        [Parameter(ParameterSetName='ById')]
        [ValidateNotNullOrEmpty()]
        [int[]]
        $SshKey
    )

    begin {
        $Payload = @{
            type = $Type
        }
        If ($PSBoundParameters.ContainsKey('SshKey')) {
            $Payload.Add('ssh_keys', $SshKey)
        }
    }

    process {
        if ($PSCmdlet.ParameterSetName -ieq 'ByName') {
            $Id = Get-HetznerCloudServer -Name $Name | Select-Object -ExpandProperty Id
        }

        $Id | ForEach-Object {
            Invoke-HetznerCloudApi -Api 'servers' -Id $_ -Action 'enable_rescue' -Method 'Post' -Payload $Payload
        }
    }
}