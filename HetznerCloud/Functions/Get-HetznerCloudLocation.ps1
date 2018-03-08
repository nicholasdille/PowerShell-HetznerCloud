function Get-HetznerCloudLocation {
    [CmdletBinding(DefaultParameterSetName='None')]
    param(
        [Parameter(ParameterSetName='ByName')]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name
        ,
        [Parameter(ParameterSetName='ById')]
        [ValidateNotNullOrEmpty()]
        [string]
        $Id
    )

    if ($PSCmdlet.ParameterSetName -ieq 'ByName') {
        Get-HetznerCloudLocation | Where-Object { $_.Name -ieq $Name }

    } else {
        Invoke-HetznerCloudApi -Api 'locations' @PSBoundParameters | ForEach-Object {
            [pscustomobject]@{
                Id = $_.id
                Name = $_.name
                Description = $_.description
                Country = $_.country
                City = $_.city
                Latitude = $_.latitude
                Longitude = $_.longitude
                PSTypeName = 'HetznerCloudLocation'
            }
        }
    }
}