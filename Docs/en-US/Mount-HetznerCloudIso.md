---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---

# Mount-HetznerCloudIso

## SYNOPSIS

Mounts an ISO on a server in the Hetzner Cloud

## SYNTAX

```powershell
Mount-HetznerCloudIso [-Server] <Int32> [-Iso] <Int32> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION

{{Fill in the Description}}

## EXAMPLES

### Example 1

```powershell
PS C:\> Mount-HetznerCloudIso -Server 555995 -Iso 27

action
------
@{id=336827; command=attach_iso; status=running; progress=0; started=2018-03-08T14:18:56+00:00; finished=; resources...
```

Mount Ubuntu 16.03 to a server

## PARAMETERS

### -Iso

ISO to be mounted on the server

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

### -Server

ID of the server to mount the ISO on

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
