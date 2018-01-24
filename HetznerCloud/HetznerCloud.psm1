$script:HetznerCloud = @{
    Server = 'https://api.hetzner.cloud/v1'
    Token = $null
}

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

function Get-HetznerCloud {
    [CmdletBinding()]
    param()

    $HetznerCloud
}

function Get-HetznerCloudSshKey {
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

    $Uri = "$($HetznerCloud.Server)/ssh_keys"
    if ($PSCmdlet.ParameterSetName -eq 'ByName') {
        $Uri += "?name=$Name"

    } elseif ($PSCmdlet.ParameterSetName -eq 'ById') {
        $Uri += "/$Id"
    }

    $Result = Invoke-RestMethod -Method Get -Uri "$Uri" -Authentication Bearer -Token $HetznerCloud.Token

    if ($PSCmdlet.ParameterSetName -eq 'ById') {
        $Result.ssh_key

    } else {
        $Result.ssh_keys
    }
}

function Add-HetznerCloudSShKey {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $PublicKey
    )

    $Payload = @{
        name = $Name
        public_key = $PublicKey
    } | ConvertTo-Json

    try {
        $Result = Invoke-RestMethod -Method Post -Uri "$($HetznerCloud.Server)/ssh_keys" -Authentication Bearer -Token $HetznerCloud.Token -ContentType 'application/json' -Body $Payload
        $Result.ssh_key

    } catch {
        $Code = [int]$_.Exception.Response.StatusCode
        $Reason = $_.Exception.Response.ReasonPhrase
        $Json = $_.ErrorDetails.Message | ConvertFrom-Json
        $Message = $Json.error.Message
        Write-Error "Received $Code ($Reason): $Message"
    }
}

function Remove-HetznerCloudSshKey {}

function Set-HetznerCloudSshKey {}

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

    $Uri = "$($HetznerCloud.Server)/server_types"
    if ($PSCmdlet.ParameterSetName -eq 'ByName') {
        $Uri += "?name=$Name"

    } elseif ($PSCmdlet.ParameterSetName -eq 'ById') {
        $Uri += "/$Id"
    }

    $Result = Invoke-RestMethod -Method Get -Uri "$Uri" -Authentication Bearer -Token $HetznerCloud.Token
    
    if ($PSCmdlet.ParameterSetName -eq 'ById') {
        $Result.server_type

    } else {
        $Result.server_types
    }
}

function Get-HetznerCloudLocation {
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

    $Uri = "$($HetznerCloud.Server)/locations"
    if ($PSCmdlet.ParameterSetName -eq 'ByName') {
        $Uri += "?name=$Name"

    } elseif ($PSCmdlet.ParameterSetName -eq 'ById') {
        $Uri += "/$Id"
    }

    $Result = Invoke-RestMethod -Method Get -Uri "$Uri" -Authentication Bearer -Token $HetznerCloud.Token
    
    if ($PSCmdlet.ParameterSetName -eq 'ById') {
        $Result.location

    } else {
        $Result.locations
    }
}

function Get-HetznerCloudDatacenter {
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

    $Uri = "$($HetznerCloud.Server)/datacenters"
    if ($PSCmdlet.ParameterSetName -eq 'ByName') {
        $Uri += "?name=$Name"

    } elseif ($PSCmdlet.ParameterSetName -eq 'ById') {
        $Uri += "/$Id"
    }

    $Result = Invoke-RestMethod -Method Get -Uri "$Uri" -Authentication Bearer -Token $HetznerCloud.Token
    
    if ($PSCmdlet.ParameterSetName -eq 'ById') {
        $Result.datacenter

    } else {
        $Result.datacenters
    }
}

function Get-HetznerCloudImage {
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

    $Uri = "$($HetznerCloud.Server)/images"
    if ($PSCmdlet.ParameterSetName -eq 'ByName') {
        $Uri += "?name=$Name"

    } elseif ($PSCmdlet.ParameterSetName -eq 'ById') {
        $Uri += "/$Id"
    }

    $Result = Invoke-RestMethod -Method Get -Uri "$Uri" -Authentication Bearer -Token $HetznerCloud.Token
    
    if ($PSCmdlet.ParameterSetName -eq 'ById') {
        $Result.image

    } else {
        $Result.images
    }
}

function Get-HetznerCloudIso {
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

    $Uri = "$($HetznerCloud.Server)/isos"
    if ($PSCmdlet.ParameterSetName -eq 'ByName') {
        $Uri += "?name=$Name"

    } elseif ($PSCmdlet.ParameterSetName -eq 'ById') {
        $Uri += "/$Id"
    }

    $Result = Invoke-RestMethod -Method Get -Uri "$Uri" -Authentication Bearer -Token $HetznerCloud.Token
    
    if ($PSCmdlet.ParameterSetName -eq 'ById') {
        $Result.iso

    } else {
        $Result.isos
    }
}

function Get-HetznerCloudPricing {
    [CmdletBinding()]
    param()

    $Result = Invoke-RestMethod -Method Get -Uri "$($HetznerCloud.Server)/pricing" -Authentication Bearer -Token $HetznerCloud.Token
    $Result.pricing
}

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

    $Uri = "$($HetznerCloud.Server)/servers"
    if ($PSCmdlet.ParameterSetName -eq 'ByName') {
        $Uri += "?name=$Name"

    } elseif ($PSCmdlet.ParameterSetName -eq 'ById') {
        $Uri += "/$Id"
    }

    $Result = Invoke-RestMethod -Method Get -Uri "$Uri" -Authentication Bearer -Token $HetznerCloud.Token
    
    if ($PSCmdlet.ParameterSetName -eq 'ById') {
        $Result.server

    } else {
        $Result.servers
    }
}

function New-HetznerCloudServer {}

function Get-HetznerCloudServerAction {}

function Get-HetznerCloudFloatingIp {
    [CmdletBinding(DefaultParameterSetName='None')]
    param(
        [Parameter(ParameterSetName='ById')]
        [ValidateNotNullOrEmpty()]
        [string]
        $Id
    )

    $Uri = "$($HetznerCloud.Server)/floating_ips"
    if ($PSCmdlet.ParameterSetName -eq 'ById') {
        $Uri += "/$Id"
    }

    $Result = Invoke-RestMethod -Method Get -Uri "$Uri" -Authentication Bearer -Token $HetznerCloud.Token
    
    if ($PSCmdlet.ParameterSetName -eq 'ById') {
        $Result.floating_ip

    } else {
        $Result.floating_ips
    }
}

function New-HetznerCloudFloatingIp {}

function Get-HetznerCloudFloatingIpAction {}