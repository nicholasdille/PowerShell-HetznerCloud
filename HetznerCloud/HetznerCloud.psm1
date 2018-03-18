# Define internal data structure
$script:HetznerCloud = @{
    Server = 'https://api.hetzner.cloud/v1'
    Token = $null
}

# Cache for datacenters
$script:HetznerCloudDatacenter = @()

# Cache for locations
$script:HetznerCloudLocation = @()

# Cache for locations
$script:HetznerCloudServerType = @()

# Import 3rd party functions
Get-ChildItem -Path "$PSScriptRoot\Functions-3rdParty" -Filter '*.ps1' -Recurse | ForEach-Object {
    Write-Verbose "Importing $($_.Name)"
    . "$($_.FullName)"
}

# Import functions
Get-ChildItem -Path "$PSScriptRoot\Functions" -Filter '*.ps1' -Recurse | ForEach-Object {
    Write-Verbose "Importing $($_.Name)"
    . "$($_.FullName)"
}