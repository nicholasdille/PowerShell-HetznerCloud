---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---

# Get-HetznerCloudFloatingIpAction

## SYNOPSIS

Retrieves actions performed on a floating IP in the Hetzner Cloud

## SYNTAX

```powershell
Get-HetznerCloudFloatingIpAction [-Id] <Int32[]> [<CommonParameters>]
```

## DESCRIPTION

Whenever you make changes to a floating IP in the Hetzner Cloud, an action is created which tracks and documents the change. This cmdlet retrieves them.

## EXAMPLES

### Example 1

```powershell
PS C:\> Get-HetznerCloudFloatingIpAction -Id 4053
```

Retrieves all action regarding the floating IP with the specified ID

## PARAMETERS

### -Id

ID of the floating IP to retrieve actions for

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

### System.Object
