---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---
# Get-HetznerCloudImage

## SYNOPSIS

Retrieves information about images

## SYNTAX

### None (Default)

```
Get-HetznerCloudImage [<CommonParameters>]
```

### ById

```
Get-HetznerCloudImage [-Id <String>] [<CommonParameters>]
```

## DESCRIPTION

Images are used to spawn servers. The response is parsed into custom objects and displayed using a custom type called `HetznerCloudImage`.

## EXAMPLES

### Example 1

```powershell
PS C:\> Get-HetznerCloudImage

Name         Type   Status    Description
----         ----   ------    -----------
ubuntu-16.04 system available Ubuntu 16.04
debian-9     system available Debian 9.3
centos-7     system available Centos 7.4
fedora-27    system available Fedora 27
```

The cmdlet produces a list of images from which servers can be spawned.

### Example 2

```powershell
PS C:\> Get-HetznerCloudImage | Format-List


Id          : 1
Type        : system
Status      : available
Name        : ubuntu-16.04
Description : Ubuntu 16.04
Created     : 15.01.2018 12:34:45
OS          : ubuntu
Version     : 16.04

Id          : 2
Type        : system
Status      : available
Name        : debian-9
Description : Debian 9.3
Created     : 15.01.2018 12:34:45
OS          : debian
Version     : 9.3

Id          : 3
Type        : system
Status      : available
Name        : centos-7
Description : Centos 7.4
Created     : 15.01.2018 12:34:45
OS          : centos
Version     : 7.4

Id          : 4
Type        : system
Status      : available
Name        : fedora-27
Description : Fedora 27
Created     : 15.01.2018 12:34:45
OS          : fedora
Version     : 27
```

This call produces all available information for images.

### Example 3

```powershell
PS C:\> Get-HetznerCloudImage -Id 1

Name         Type   Status    Description
----         ----   ------    -----------
ubuntu-16.04 system available Ubuntu 16.04
```

This call produces informaton about a single image.

## PARAMETERS

### -Id

The ID of an image

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

Get-HetznerCloudLocation
Get-HetznerCloudDatacenter
Get-HetznerCloudServerType
Get-HetznerCloudIso
Get-HetznerCloudPricing
