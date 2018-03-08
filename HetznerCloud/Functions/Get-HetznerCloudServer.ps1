function Get-HetznerCloudServer {
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
        Get-HetznerCloudServer | Where-Object { $_.Name -ieq $Name }

    } else {
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
                Backup = $_.backup_window
                RescueSystem = $_.rescue_enabled
                'PSTypeName' = 'HetznerCloudServer'
            }
        }
    }
}