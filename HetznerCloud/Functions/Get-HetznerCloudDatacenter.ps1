function Get-HetznerCloudDatacenter {
    [CmdletBinding(DefaultParameterSetName='None')]
    param(
        [Parameter(ParameterSetName='ById')]
        [ValidateNotNullOrEmpty()]
        [string]
        $Id
    )

    Invoke-HetznerCloudApi -Api 'datacenters' @PSBoundParameters | ForEach-Object {
        [pscustomobject]@{
            Id = $_.id
            Name = $_.name
            Description = $_.description
            Location = $_.location.name
            #SupportedServerTypeIds = @($_.server_types.supported)
            #AvailableServerTypeIds = @($_.server_types.available)
            PSTypeName = 'HetznerCloudDatacenter'
        }
    }
}