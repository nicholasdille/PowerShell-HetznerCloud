---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---
# Get-HetznerCloudDatacenter

## SYNOPSIS

Retrieves information about datacenters

## SYNTAX

### None (Default)

```
Get-HetznerCloudDatacenter [<CommonParameters>]
```

### ById

```
Get-HetznerCloudDatacenter [-Id <String>] [<CommonParameters>]
```

## DESCRIPTION

The Hetzner Cloud is operated from a set of datacenters. The response is parsed into custom objects and displayed using the custom format `HetznerCloudDatacenter`.

## EXAMPLES

### Example 1

```powershell
PS C:\> Get-HetznerCloudDatacenter

Name     Description
----     -----------
fsn1-dc8 Falkenstein 1 DC 8
nbg1-dc3 Nuremberg 1 DC 3
```

The cmdlet produces a list of datacenter from which the Hetzner Cloud is operated.

### Example 2

```powershell
PS C:\> Get-HetznerCloudDatacenter | Format-List

Id          : 1
Name        : fsn1-dc8
Description : Falkenstein 1 DC 8
Location    : fsn1

Id          : 2
Name        : nbg1-dc3
Description : Nuremberg 1 DC 3
Location    : nbg1
```

This call produces all available information for datacenters.

### Example 3

```powershell
PS C:\> Get-HetznerCloudDatacenter -Id 1

Name     Description
----     -----------
fsn1-dc8 Falkenstein 1 DC 8
```

This call produces informaton about a single datacenter.

## PARAMETERS

### -Id

The ID of a datacenter

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
Get-HetznerCloudServerType
Get-HetznerCloudImage
Get-HetznerCloudIso
Get-HetznerCloudPricing
