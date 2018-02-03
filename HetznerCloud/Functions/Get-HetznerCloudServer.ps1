function Get-HetznerCloudServer {
    [CmdletBinding(DefaultParameterSetName='None')]
    param(
        [Parameter(ParameterSetName='ById')]
        [ValidateNotNullOrEmpty()]
        [string]
        $Id
    )

    Invoke-HetznerCloudApi -Api 'servers' @PSBoundParameters | ForEach-Object {
        [pscustomobject]@{
            Id = $_.id
            Name = $_.name
            Status = $_.status
            Created = $_.created
            Type = $_.server_type.name
            Datacenter = $_.datacenter.name
            Location = $_.datacenter.location.name
            Image = $_.image.name
            Iso = ''
            RescueSystem = $_.rescue_enabled
            'PSTypeName' = 'HetznerCloudServer'
        }
    }
}