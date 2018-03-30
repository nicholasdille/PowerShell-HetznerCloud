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
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [SecureString]
        $Token = (Read-Host -Prompt 'Please enter token' -AsSecureString)
    )

    $HetznerCloud.Token = $Token

    Import-HetznerCloud
}