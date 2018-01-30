# Define internal data structure
$script:HetznerCloud = @{
    Server = 'https://api.hetzner.cloud/v1'
    Token = $null
}

# Import functions
Get-ChildItem -Path "$PSScriptRoot\Functions" -Filter '*.ps1' -Recurse | ForEach-Object {
    . "$($_.FullName)"
}