---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---

# Start-HetznerCloudServer

## SYNOPSIS

Start a server

## SYNTAX

```powershell
Start-HetznerCloudServer [-Id] <Int32[]> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION

This cmdlet starts a server which is not powered on

## EXAMPLES

### Example 1

```powershell
PS C:\> Start-HetznerCloudServer -Id 264286

action
------
@{id=264286; command=start_server; status=running; progress=0; started=28.02.2018 17:32:09; finished=; resources=System.Object[]; error=}
```

Powers on all server provided on the pipeline

### Example 2

```powershell
PS C:\> Get-HetznerCloudServer | Start-HetznerCloudServer

action
------
@{id=264286; command=start_server; status=running; progress=0; started=28.02.2018 17:32:09; finished=; resources=System.Object[]; error=}
```

Powers on all server provided on the pipeline

## PARAMETERS

### -Id

ID of the server to power on

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
