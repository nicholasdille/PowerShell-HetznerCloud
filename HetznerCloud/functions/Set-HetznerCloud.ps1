function Set-HetznerCloud {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Token
    )

    $HetznerCloud.Token = ConvertTo-SecureString -String $Token -AsPlainText -Force
}