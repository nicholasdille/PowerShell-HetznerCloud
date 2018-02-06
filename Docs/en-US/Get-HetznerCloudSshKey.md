---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---
# Get-HetznerCloudSshKey

## SYNOPSIS

Retreive SSH keys

## SYNTAX

### None (Default)

```
Get-HetznerCloudSshKey [<CommonParameters>]
```

### ById

```
Get-HetznerCloudSshKey [-Id <String>] [<CommonParameters>]
```

## DESCRIPTION

Access to servers is provided by SSH keys. This cmdlet allows adding an SSH public key to the Hetzner Cloud account. The SSH public key can be referenced when creating a server (`New-HetznerCloudServer`) or enabling the rescue system (`Enable-HetznerCloudServerRescue`).

## EXAMPLES

### Example 1

```powershell
PS C:\> Get-HetznerCloudSshKey

Name  Fingerprint
----  -----------
mykey ca:82:7b:d6:7c:bb:70:5f:12:2a:3b:29:bf:0e:a2:fd
```

Retrieve a list of all (previously uploaded) SSH keys.

### Example 2

```powershell
PS C:\> Get-HetznerCloudSshKey -Id 1841

Name  Fingerprint
----  -----------
mykey ca:82:7b:d6:7c:bb:70:5f:12:2a:3b:29:bf:0e:a2:fd
```

Retrieves a single SSH key.

### Example 3

```powershell
PS C:\> Get-HetznerCloudSshKey -Id 1841 | Format-List


Id          : 1841
Name        : mykey
Fingerprint : ca:82:7b:d6:7c:bb:70:5f:12:2a:3b:29:bf:0e:a2:fd
PublicKey   : ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDLF1P9cSi8YXclN1vpLOFKydIczWbfJj92RWLOeo3dmrPGkeBtmtpJU3DWqWxJkelag
              r5oQGn5XRu08GfdKJyPCZEoThzqaRHOKZGN79JpRjabIm8boHQE04cYP+0L4wbN53dpthPCeA6FkDNyKoJ+K8qTqmLDGsO2ztVLBMXEU3
              kiler/4jSLP+kbMn5tSuHlyZdsv+4DaZb3atwkC7yrZd/uF4t8uCO+xB6k3USHqmcgguzCu25V0yGqjlvDb2Jz1InoYdpCqbEMIvHVxMs
              d7dJHYO6afgn8GWOHsbpyPzJn2v73nldtJUJoSr2UDrpwkKZ3zVUnO/9aw5Y5qiR7 nicholas@anneliese
```

Retrieves detailed information about a SSH key.

## PARAMETERS

### -Id

The ID of an SSH key

```yaml
Type: String
Parameter Sets: ById
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## RELATED LINKS

Add-HetznerCloudSshKey
Remove-HetznerCloudSshKey
New-HetznerCloudServer
Enable-HetznerCloudServerRescue
