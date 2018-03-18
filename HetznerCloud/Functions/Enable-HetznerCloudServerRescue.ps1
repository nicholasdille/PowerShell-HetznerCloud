function Enable-HetznerCloudServerRescue {
    [CmdletBinding()]
    param(
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

    DynamicParam {
        @(
            @{
                Name = 'Name'
                Type = [string]
                ParameterSetName = 'ByName'
                Mandatory = $true
                ValidateSet = Get-HetznerCloudServer | Select-Object -ExpandProperty Name
            }

            @{
                Name = 'SshKey'
                Type = [int]
                ParameterSetName = 'ByName'
                ValidateSet = Get-HetznerCloudSshKey | Select-Object -ExpandProperty Name
            }

            @{
                Name = 'SshKey'
                Type = [int]
                ParameterSetName = 'ById'
                ValidateSet = Get-HetznerCloudSshKey | Select-Object -ExpandProperty Name
            }

        ) | ForEach-Object { New-Object PSObject -Property $_ } | New-DynamicParameter
    }

    begin {
        $Payload = @{
            type = $Type
        }
        If ($PSBoundParameters.ContainsKey('SshKey')) {
            $Payload.Add('ssh_keys', $SshKey)
        }
    }

    process {
        New-DynamicParameter -CreateVariables -BoundParameters $PSBoundParameters

        if ($PSCmdlet.ParameterSetName -ieq 'ByName') {
            $Id = Get-HetznerCloudServer -Name $Name | Select-Object -ExpandProperty Id
        }

        $Id | ForEach-Object {
            Invoke-HetznerCloudApi -Api 'servers' -Id $_ -Action 'enable_rescue' -Method 'Post' -Payload $Payload
        }
    }
}