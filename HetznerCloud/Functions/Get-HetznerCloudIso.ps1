function Get-HetznerCloudIso {
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
        Get-HetznerCloudIso | Where-Object { $_.Name -ieq $Name }

    } else {
        Invoke-HetznerCloudApi -Api 'isos' @PSBoundParameters | ForEach-Object {
            [pscustomobject]@{
                Id = $_.id
                Name = $_.name
                Description = $_.description
                PSTypeName = 'HetznerCloudIso'
            }
        }
    }
}