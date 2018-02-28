---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---
# Get-HetznerCloudLocation

## SYNOPSIS

Retrieves information about datacenter locations

## SYNTAX

### None (Default)

```powershell
Get-HetznerCloudLocation [<CommonParameters>]
```

### ById

```powershell
Get-HetznerCloudLocation [-Id <String>] [<CommonParameters>]
```

## DESCRIPTION

The Hetzner Cloud is operated from a set of datacenters from different geographical locations. The response is parsed into custom objects and displayed using the custom format `HetznerCloudLocation`.

## EXAMPLES

### Example 1

```powershell
PS C:\> Get-HetznerCloudLocation

Name Country City
---- ------- ----
fsn1 DE      Falkenstein
nbg1 DE      Nuremberg
```

The cmdlet produces a list of locations where the datacenters of the Hetzner Cloud are operated.

### Example 2

```powershell
PS C:\> Get-HetznerCloudLocation | Format-List


Id          : 1
Name        : fsn1
Description : Falkenstein DC Park 1
Country     : DE
City        : Falkenstein
Latitude    : 50,47612
Longitude   : 12,370071

Id          : 2
Name        : nbg1
Description : Nuremberg DC Park 1
Country     : DE
City        : Nuremberg
Latitude    : 49,452102
Longitude   : 11,076665
```

This call produces all available information for locations.

### Example 3

```powershell
PS C:\> Get-HetznerCloudLocation -Id 1

Name Country City
---- ------- ----
fsn1 DE      Falkenstein
```

This call produces informaton about a single location.

## PARAMETERS

### -Id

The ID of a location

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

### HetznerCloudLocation
