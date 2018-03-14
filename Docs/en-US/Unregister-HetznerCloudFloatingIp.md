---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---

# Unregister-HetznerCloudFloatingIp

## SYNOPSIS

Unassigned a floating IP from a server in the Hetzner Cloud

## SYNTAX

```powershell
Unregister-HetznerCloudFloatingIp [-Id] <Int32> [<CommonParameters>]
```

## DESCRIPTION

This cmdlet unassigns a floating IP from a server.

## EXAMPLES

### Example 1

```powershell
PS C:\> Unregister-HetznerCloudFloatingIp -Id 4053

action
------
@{id=397964; command=unassign_floating_ip; status=running; progress=0; started=2018-03-14T20:54:57+00:00; finished=;...
```

Unassigns the specified floating IP from the specified server

## PARAMETERS

### -Id

ID of the floating IP to unassign

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
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

### System.Object
