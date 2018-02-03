@{
    RootModule = 'HetznerCloud.psm1'
    ModuleVersion = '0.8'
    GUID = 'cbab1272-69f6-4fa8-94d0-ae96e2303ee5'
    Author = 'Nicholas Dille'
    #CompanyName = ''
    Copyright = '(c) 2018 Nicholas Dille. All rights reserved.'
    Description = 'Cmdlets for Hetzner Cloud'
    # PowerShellVersion = ''
    # RequiredModules = @()
    FunctionsToExport = @(
        'Add-HetznerCloudSShKey'
        'Disable-HetznerCloudServerBackup'
        'Disable-HetznerCloudServerRescue'
        'Dismount-HetznerCloudIso'
        'Enable-HetznerCloudServerBackup'
        'Enable-HetznerCloudServerRescue'
        'Get-HetznerCloud'
        'Get-HetznerCloudAction'
        'Get-HetznerCloudDatacenter'
        'Get-HetznerCloudFloatingIp'
        'Get-HetznerCloudFloatingIpAction'
        'Get-HetznerCloudImage'
        'Get-HetznerCloudIso'
        'Get-HetznerCloudLocation'
        'Get-HetznerCloudPricing'
        'Get-HetznerCloudServer'
        'Get-HetznerCloudServerAction'
        'Get-HetznerCloudServerMetric'
        'Get-HetznerCloudServerType'
        'Get-HetznerCloudSshKey'
        'Invoke-HetznerCloudApi'
        'Mount-HetznerCloudIso'
        'New-HetznerCloudFloatingIp'
        'New-HetznerCloudImage'
        'New-HetznerCloudServer'
        'Register-HetznerCloudFloatingIp'
        'Remove-HetznerCloudFloatingIp'
        'Remove-HetznerCloudImage'
        'Remove-HetznerCloudServer'
        'Remove-HetznerCloudSshKey'
        'Restart-HetznerCloudServer'
        'Restore-HetznerCloudServer'
        'Set-HetznerCloud'
        'Set-HetznerCloudFloatingIp'
        'Set-HetznerCloudServer'
        'Set-HetznerCloudSshKey'
        'Start-HetznerCloudServer'
        'Stop-HetznerCloudServer'
        'Unregister-HetznerCloudFloatingIp'
        'Wait-HetznerCloudServer'
    )
    CmdletsToExport = @()
    VariablesToExport = '*'
    AliasesToExport = @()
    FormatsToProcess = @(
        'HetznerCloudLocation.Format.ps1xml'
        'HetznerCloudDatacenter.Format.ps1xml'
        'HetznerCloudIso.Format.ps1xml'
        'HetznerCloudImage.Format.ps1xml'
        'HetznerCloudSshKey.Format.ps1xml'
        'HetznerCloudFloatingIp.Format.ps1xml'
        'HetznerCloudServer.Format.ps1xml'
    )
    PrivateData = @{
        PSData = @{
            # Tags = @()
            LicenseUri = 'https://github.com/nicholasdille/PowerShell-HetznerCloud/blob/master/LICENSE'
            ProjectUri = 'https://github.com/nicholasdille/PowerShell-HetznerCloud'
            ReleaseNotes = 'https://github.com/nicholasdille/PowerShell-HetznerCloud/blob/master/RELEASENOTES.md'
        }
    }
}
