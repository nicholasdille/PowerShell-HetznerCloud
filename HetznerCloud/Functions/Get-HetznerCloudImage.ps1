function Get-HetznerCloudImage {
    [CmdletBinding(DefaultParameterSetName='None')]
    param(
        [Parameter(ParameterSetName='ById')]
        [ValidateNotNullOrEmpty()]
        [string]
        $Id
    )

    Invoke-HetznerCloudApi -Api 'images' @PSBoundParameters | ForEach-Object {
        [pscustomobject]@{
            Id = $_.id
            Type = $_.type
            Status = $_.status
            Name = $_.name
            Description = $_.description
            Created = $_.created
            OS = $_.os_flavor
            Version = $_.os_version
            PSTypeName = 'HetznerCloudImage'
        }
    }
}