function Get-HetznerCloudImage {
    [CmdletBinding(DefaultParameterSetName='None')]
    param(
        [Parameter(ParameterSetName='ById')]
        [ValidateNotNullOrEmpty()]
        [string]
        $Id
    )

    Invoke-HetznerCloudApi -Api 'images' @PSBoundParameters
}