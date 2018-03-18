function Get-HetznerCloudServerType {
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
        Get-HetznerCloudServerType | Where-Object { $_.Name -ieq $Name }

    } else {
        Invoke-HetznerCloudApi -Api 'server_types' @PSBoundParameters | ForEach-Object {
            [pscustomobject]@{
                Id = $_.id
                Name = $_.name
                Cores = $_.cores
                Memory = $_.memory
                Storage = $_.disk
                StorageType = $_.storage_type
                PSTypeName = 'HetznerCloudServerType'
            }
        }
    }
}