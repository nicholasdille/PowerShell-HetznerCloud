# Introduction

Cmdlets for [Hetzner Cloud](https://www.hetzner.com/cloud) working for Windows PowerShell 3+ and PowerShell Core 6

[![Build status](https://ci.appveyor.com/api/projects/status/7vbg47o01ju1h8gq?svg=true)](https://ci.appveyor.com/project/nicholasdille/powershell-hetznercloud) [![Download](https://img.shields.io/badge/powershellgallery-HetznerCloud-blue.svg)](https://www.powershellgallery.com/packages/HetznerCloud/)

## Usage

Let me first help you help yourself:

```powershell
Install-Module -Name HetznerCloud
Get-Command -Module HetznerCloud
```

### Configuring your API token

You will need to call the following cmdlet to configure the module to use your API token. 

```powershell
Set-HetznerCloud -Token 'my_token_from_the_web_console'
```

Please remember to call `Set-HetznerCloud` everytime you want to execute cmdlets from this module in a new shell or after importing the module.

### Taking a look at the infrastructure

```powershell
Get-HetznerCloudLocation
Get-HetznerCloudDatacenter
Get-HetznerCloudServerType
Get-HetznerCloudImage
Get-HetznerCloudPricing
```

### Uploading an SSH public key

```powershell
Add-HetznerCloudSshKey -Name 'mykey' -PublicKey 'my_public_key'
Get-HetznerCloudSshKey
```

### Creating a server

```powershell
New-HetznerCloudServer -Name 'my_server' -Type cx11 -Image ubuntu-16.04 -SshKey 'mykey'
Get-HetznerCloudServer
```

## Status

Please refer to the [GitHub issues](https://github.com/nicholasdille/PowerShell-HetznerCloud/issues).
