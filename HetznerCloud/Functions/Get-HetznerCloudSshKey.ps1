function Get-HetznerCloudSshKey {
    [CmdletBinding(DefaultParameterSetName='None')]
    param(
        [Parameter(ParameterSetName='ById')]
        [ValidateNotNullOrEmpty()]
        [string]
        $Id
    )

    Invoke-HetznerCloudApi -Api 'ssh_keys' @PSBoundParameters | ForEach-Object {
        [pscustomobject]@{
            Id = $_.id
            Name = $_.name
            Fingerprint = $_.fingerprint
            PublicKey = $_.public_key
            PSTypeName = 'HetznerCloudSshKey'
        }
    }
}