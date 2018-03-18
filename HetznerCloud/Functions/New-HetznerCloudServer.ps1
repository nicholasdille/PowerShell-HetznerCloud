function New-HetznerCloudServer {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='Medium', DefaultParameterSetName='ByDatacenter')]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name
        ,
        [Parameter()]
        [switch]
        $NoStartAfterCreate
    )

    DynamicParam {
        @(
            @{
                Name = 'Type'
                Type = [string]
                Mandatory = $true
                ValidateSet = $script:HetznerCloudServerType | Select-Object -ExpandProperty Name
            }

            @{
                Name = 'Image'
                Type = [string]
                Mandatory = $true
                ValidateSet = $script:HetznerCloudImage | Select-Object -ExpandProperty Name
            }

            @{
                Name = 'SshKey'
                Type = [string]
                Mandatory = $true
                ValidateSet = $script:HetznerCloudSshKey | Select-Object -ExpandProperty Name
            }

            @{
                Name = 'Datacenter'
                Type = [string]
                ParameterSetName = 'ByDatacenter'
                Mandatory = $true
                ValidateSet = $script:HetznerCloudDatacenter | Select-Object -ExpandProperty Name
            }

            @{
                Name = 'Location'
                Type = [string]
                ParameterSetName = 'ByLocation'
                Mandatory = $true
                ValidateSet = $script:HetznerCloudLocation | Select-Object -ExpandProperty Name
            }

        ) | ForEach-Object { New-Object PSObject -Property $_ } | New-DynamicParameter
    }

    begin {
        if (-not $PSBoundParameters.ContainsKey('Confirm')) {
            $ConfirmPreference = $PSCmdlet.SessionState.PSVariable.GetValue('ConfirmPreference')
        }
        if (-not $PSBoundParameters.ContainsKey('WhatIf')) {
            $WhatIfPreference = $PSCmdlet.SessionState.PSVariable.GetValue('WhatIfPreference')
        }

        New-DynamicParameter -CreateVariables -BoundParameters $PSBoundParameters
    }

    process {
        $SshKeyIds = @()
        $SshKeys = Get-HetznerCloudSshKey
        foreach ($KeyName in $SshKey) {
            $SshKeyId = $SshKeys | Where-Object { $_.Name -ieq $KeyName } | Select-Object -ExpandProperty Id
            if (-not $SshKeyId) {
                throw "SSH key with name $KeyName not found"
            }
            $SshKeyIds += $SshKeyId
        }
        $Payload = @{
            name = $Name
            server_type = $Type
            image = $Image
            ssh_keys = $SshKeyIds
        }
        if ($PSBoundParameters.ContainsKey('NoStartAfterCreate')) {
            $Payload.Add('start_after_create', $false)
        }
        if ($PSBoundParameters.ContainsKey('Datacenter')) {
            $Payload.Add('datacenter', $Datacenter)
        }
        if ($PSBoundParameters.ContainsKey('Location')) {
            $Payload.Add('location', $Location)
        }

        if ($Force -or $PSCmdlet.ShouldProcess("Add new server called '$Name'?")) {
            Invoke-HetznerCloudApi -Api 'servers' -Method 'Post' -Payload $Payload
        }
    }
}