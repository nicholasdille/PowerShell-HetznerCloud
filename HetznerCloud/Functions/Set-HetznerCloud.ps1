function Set-HetznerCloud {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute(
        "PSAvoidUsingConvertToSecureStringWithPlaintext",
        'ConvertTo-SecureString',
        Justification = "At some point the conversion must take place"
    )]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute(
        "PSUseShouldProcessForStateChangingFunctions",
        '',
        Justification = "Only stores the token in the module context"
    )]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Token
    )

    $HetznerCloud.Token = ConvertTo-SecureString -String $Token -AsPlainText -Force

    Import-HetznerCloud
}