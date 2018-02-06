---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---
# Get-HetznerCloudIso

## SYNOPSIS

Retrieves information about ISOs

## SYNTAX

### None (Default)

```
Get-HetznerCloudIso [<CommonParameters>]
```

### ById

```
Get-HetznerCloudIso [-Id <String>] [<CommonParameters>]
```

## DESCRIPTION

ISOs can be connected to servers to access OS sources. The response is parsed into custom objects and displayed using a custom type called `HetznerCloudIso`.

## EXAMPLES

### Example 1

```powershell
PS C:\> Get-HetznerCloudIso

Name                                                                                Description
----                                                                                -----------
virtio-win-0.1.141.iso                                                              virtio 0.1.141-1
ubuntu-16.04.3-server-amd64.iso                                                     Ubuntu 16.04.3 (amd64/netinstall)
ubuntu-17.10.1-server-amd64.iso                                                     Ubuntu 17.10.1 (amd64/netinstall)
debian-9.3.0-amd64-netinst.iso                                                      Debian 9.3 (amd64/netinstall)
SW_DVD9_Win_Svr_STD_Core_and_DataCtr_Core_2016_64Bit_English_-2_MLF_X21-22843.iso   Windows Server 2016 English

#...
```

Retrieve a list of ISOs available in the Hetzner Cloud.

### Example 2

```powershell
PS C:\> Get-HetznerCloudIso -Id 26

Name                   Description
----                   -----------
virtio-win-0.1.141.iso virtio 0.1.141-1
```

List all information for a single ISO.

### Example 3

```powershell
PS C:\> Get-HetznerCloudIso | Format-List


Id          : 26
Name        : virtio-win-0.1.141.iso
Description : virtio 0.1.141-1

Id          : 27
Name        : ubuntu-16.04.3-server-amd64.iso
Description : Ubuntu 16.04.3 (amd64/netinstall)

Id          : 28
Name        : ubuntu-17.10.1-server-amd64.iso
Description : Ubuntu 17.10.1 (amd64/netinstall)

Id          : 29
Name        : debian-9.3.0-amd64-netinst.iso
Description : Debian 9.3 (amd64/netinstall)

Id          : 30
Name        : SW_DVD9_Win_Svr_STD_Core_and_DataCtr_Core_2016_64Bit_English_-2_MLF_X21-22843.iso
Description : Windows Server 2016 English

#...
```

List all information for ISOs.

## PARAMETERS

### -Id

The ID of an ISO

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

## INPUTS

### None

## OUTPUTS

### HetznerCloudIso

## RELATED LINKS

Get-HetznerCloudLocation
Get-HetznerCloudDatacenter
Get-HetznerCloudServerType
Get-HetznerCloudImage
Get-HetznerCloudPricing
