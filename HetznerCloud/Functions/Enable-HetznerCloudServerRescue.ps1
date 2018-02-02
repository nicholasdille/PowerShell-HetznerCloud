function Enable-HetznerCloudServerRescue {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [int[]]
        $Id
        ,
        [Parameter()]
        [ValidateSet('linux64', 'linux32', 'freebsd64')]
        [string]
        $Type = 'linux64'
        ,
        [Parameter()]
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
        $Id | ForEach-Object {
            Invoke-HetznerCloudApi -Api 'servers' -Id $_ -Action 'enable_rescue' -Method 'Post' -Payload $Payload
        }
    }
}