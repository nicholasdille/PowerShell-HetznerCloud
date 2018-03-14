---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---

# Register-HetznerCloudFloatingIp

## SYNOPSIS

Assigns a new floating IP to a server in the Hetzner Cloud

## SYNTAX

```powershell
Register-HetznerCloudFloatingIp [-Id] <Int32> [-Server] <Int32> [<CommonParameters>]
```

## DESCRIPTION

A floating IP is assigned to a server in the Hetzner Cloud

## EXAMPLES

### Example 1

```powershell
PS C:\> Register-HetznerCloudFloatingIp -Id 4053 -Server 566170

action
------
@{id=397885; command=assign_floating_ip; status=running; progress=0; started=2018-03-14T20:41:24+00:00; finished=; r...
```

Assigns the specified floating IP to the specified server

## PARAMETERS

### -Id

ID of the floating IP to be assigned to a server

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

### -Server

ID of the server to assign a floating IP to

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
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
