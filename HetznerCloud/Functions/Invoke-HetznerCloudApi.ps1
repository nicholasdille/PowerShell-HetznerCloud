function Invoke-HetznerCloudApi {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Api
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [int]
        $Id
        ,
        [Parameter()]
        [Microsoft.PowerShell.Commands.WebRequestMethod]
        [string]
        $Method = 'Get'
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [hashtable]
        $Payload
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [int]
        $PageSize = 25
    )

    $ApiData = Get-HetznerCloud

    $Params = @{
        Method = $Method
        Authentication = 'Bearer'
        Token = $ApiData.Token
        ContentType = 'application/json'
    }
    if ($PSBoundParameters.ContainsKey('Payload')) {
        $Params.Add('Body', ($Payload | ConvertTo-Json))
    }

    $BaseUri = "$($ApiData.Server)/$Api"
    if ($PSBoundParameters.ContainsKey('Id')) {
        $BaseUri += "/$Id"
    
    } else {
        $BaseUri += "?per_page=$PageSize"
    }

    $Result = @()
    $NextPage = 1
    $NextPageUri = $BaseUri
    try {
        while ([bool]$NextPage) {
            Write-Verbose "Fetching URI $NextPageUri"
            $Response = Invoke-RestMethod -Uri $NextPageUri @Params
            if (Get-Member -InputObject $Response -MemberType Properties -Name $Api) {
                $Result += $Response | Select-Object -ExpandProperty $Api
            
            } elseif (Get-Member -InputObject $Response -MemberType Properties -Name $Api.TrimEnd('s')) {
                $Result += $Response | Select-Object -ExpandProperty $Api.TrimEnd('s')

            } else {
                $Result += $Response
            }

            $NextPage = $Response.meta.pagination.next_page
            if ($NextPage) {
                $NextPageUri = "$($BaseUri)&page=$NextPage"
            }
        }

    } catch {
        $Code = [int]$_.Exception.Response.StatusCode
        $Reason = $_.Exception.Response.ReasonPhrase
        $Json = $_.ErrorDetails.Message | ConvertFrom-Json -ErrorAction SilentlyContinue
        $Message = $Json.error.Message
        Write-Error "Received $Code ($Reason): $Message"
    }

    $Result
}