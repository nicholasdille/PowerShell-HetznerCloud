# Introduction

Cmdlets for [Hetzner Cloud](https://www.hetzner.com/cloud)

| AppVeyor | Download |
| :------: | :------: |
| [![Build status](https://ci.appveyor.com/api/projects/status/7vbg47o01ju1h8gq?svg=true)](https://ci.appveyor.com/project/nicholasdille/powershell-hetznercloud) | [![Download](https://img.shields.io/badge/powershellgallery-HetznerCloud-blue.svg)](https://www.powershellgallery.com/packages/HetznerCloud/) 

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

I have only just started with the work on this module. Therefore, it is currently lacking...

- Creation of objects

- Dynamic parameters

- Modification of objects

- Error handling

- Unit tests

- Checking rate limit information

The module will be targeting PowerShell Core 6 to run on Windows as well as Linux. Backporting to Windows PowerShell is not planned (yet). 

This repo is still missing the Appveyor pipeline for building and publishing.