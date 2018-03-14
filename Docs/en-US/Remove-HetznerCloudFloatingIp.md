---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---
# Remove-HetznerCloudFloatingIp

## SYNOPSIS

Removes a floating IP

## SYNTAX

```powershell
Remove-HetznerCloudFloatingIp [-Id] <Int32[]> [<CommonParameters>]
```

## DESCRIPTION

The specified floating IP is unassigned from a server and removed.

## EXAMPLES

### Example 1

```powershell
PS C:\> Remove-HetznerCloudFloatingIp -Id 939
```

Removes the floating IPs with the specified ID.

### Example 2

```powershell
PS C:\> Get-HetznerCloudFloatingIp | Remove-HetznerCloudFloatingIp
```

Removes all floating IPs sent by `Get-HetznerCloudFloatingIp`.

## PARAMETERS

### -Id

The ID of the floating IP

```yaml
Type: Int32[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Int32[]

## OUTPUTS

### None

## NOTES

## RELATED LINKS
