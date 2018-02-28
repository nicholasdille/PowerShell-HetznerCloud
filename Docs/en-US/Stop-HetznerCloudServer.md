---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---

# Stop-HetznerCloudServer

## SYNOPSIS

Stops a server in the Hetzner Cloud

## SYNTAX

```powershell
Stop-HetznerCloudServer [-Id] <Int32[]> [[-Action] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION

This server sends a soft or hard power down action to a server in the Hetzner Cloud

## EXAMPLES

### Example 1

```powershell
PS C:\> Stop-HetznerCloudServer -Id 264278

action
------
@{id=264278; command=shutdown_server; status=running; progress=0; started=28.02.2018 17:30:41; finished=; resources=System.Object[]; error=}
```

Powers down a list of server provided on the pipeline

### Example 2

```powershell
PS C:\> Get-HetznerCloudServer | Stop-HetznerCloudServer

action
------
@{id=264278; command=shutdown_server; status=running; progress=0; started=28.02.2018 17:30:41; finished=; resources=System.Object[]; error=}
```

Powers down a list of server provided on the pipeline

## PARAMETERS

### -Action

Power action to call

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Shutdown, PowerOff

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Id

ID of the server to be powered off

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

## NOTES
