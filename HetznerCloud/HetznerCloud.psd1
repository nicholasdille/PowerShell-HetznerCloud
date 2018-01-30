@{
    RootModule = 'HetznerCloud.psm1'
    ModuleVersion = '0.5'
    GUID = 'cbab1272-69f6-4fa8-94d0-ae96e2303ee5'
    Author = 'Nicholas Dille'
    #CompanyName = ''
    Copyright = '(c) 2018 Nicholas Dille. All rights reserved.'
    Description = 'Cmdlets for Hetzner Cloud'
    # PowerShellVersion = ''
    # RequiredModules = @()
    FunctionsToExport = @(
		# Authentication
		'Set-HetznerCloud'
		
		# Infrastructure
		'Get-HetznerCloudDatacenter'
		'Get-HetznerCloudLocation'
		'Get-HetznerCloudServerType'
		'Get-HetznerCloudImage'
		'Get-HetznerCloudIso'
		'Get-HetznerCloudPricing'
		'Get-HetznerCloudAction'

		# SSH keys
		'Get-HetznerCloudSshKey'
		'Add-HetznerCloudSshKey'
		'Remove-HetznerCloudSshKey'
		'Set-HetznerCloudSshKey'

		# Servers
		'Get-HetznerCloudServer'
		'New-HetznerCloudServer'
		'Remove-HetznerCloudServer'
		'Get-HetznerCloudServerAction'

		# Floating IP
		'Get-HetznerCloudFloatingIp'
		'New-HetznerCloudFloatingIp'
		'Remove-HetznerCloudFloatingIp'
	)
    CmdletsToExport = @()
    VariablesToExport = '*'
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            # Tags = @()
            # LicenseUri = ''
            # ProjectUri = ''
            # ReleaseNotes = ''
        }
    }
}
