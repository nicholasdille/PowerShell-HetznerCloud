function New-HetznerCloudServer {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='Medium', DefaultParameterSetName='ByDatacenter')]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name
        ,
        [Parameter(Mandatory)]
        [ValidateSet('cx11', 'cx11-ceph', 'cx21', 'cx21-ceph', 'cx31', 'cx31-ceph', 'cx41', 'cx41-ceph', 'cx51', 'cx51-ceph')]
        [string]
        $Type
        ,
        [Parameter(Mandatory)]
        [ValidateSet('ubuntu-16.04', 'debian-9', 'centos-7', 'fedora-27')]
        [string]
        $Image
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        $SshKey
        ,
        [Parameter(ParameterSetName='ByDatacenter')]
        [ValidateSet('fsn1-dc8', 'nbg1-dc3')]
        [string]
        $Datacenter
        ,
        [Parameter(ParameterSetName='ByLocation')]
        [ValidateSet('fsn1', 'nbg1')]
        [string]
        $Location
        ,
        [Parameter()]
        [switch]
        $NoStartAfterCreate
    )

    begin {
        if (-not $PSBoundParameters.ContainsKey('Confirm')) {
            $ConfirmPreference = $PSCmdlet.SessionState.PSVariable.GetValue('ConfirmPreference')
        }
        if (-not $PSBoundParameters.ContainsKey('WhatIf')) {
            $WhatIfPreference = $PSCmdlet.SessionState.PSVariable.GetValue('WhatIfPreference')
        }
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