---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---
# Get-HetznerCloudFloatingIp

## SYNOPSIS

Retrieves floating IPs

## SYNTAX

### None (Default)

```
Get-HetznerCloudFloatingIp [<CommonParameters>]
```

### ById

```
Get-HetznerCloudFloatingIp [-Id <String>] [<CommonParameters>]
```

## DESCRIPTION

Floating IPs are used to assign a permanent IP address to a server. The output is parsed into a custom type and format called `HetznerCloudFloatingIp`.

## EXAMPLES

### Example 1

```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -Id

The ID of a floating IP

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

### HetznerCloudFloatingIp
