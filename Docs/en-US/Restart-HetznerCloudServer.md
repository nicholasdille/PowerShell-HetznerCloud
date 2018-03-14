---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---

# Restart-HetznerCloudServer

## SYNOPSIS

Restarts a server in the Hetzner Cloud

## SYNTAX

```powershell
Restart-HetznerCloudServer [-Id] <Int32[]> [[-Action] <String>] [<CommonParameters>]
```

## DESCRIPTION

This cmdlet calls a soft or hard reset power action for the specified server

## EXAMPLES

### Example 1

```powershell
PS C:\> Restart-HetznerCloudServer -Id 541232

action
------
@{id=264318; command=reboot_server; status=running; progress=0; started=28.02.2018 17:35:58; finished=; resources=System.Object[]; error=}
```

Restarts all server provided on the pipeline

### Example 2

```powershell
PS C:\> Get-HetznerCloudServer | Restart-HetznerCloudServer

action
------
@{id=264308; command=reboot_server; status=running; progress=0; started=28.02.2018 17:35:11; finished=; resources=System.Object[]; error=}
```

Restarts all server provided on the pipeline

## PARAMETERS

### -Action

Power action to be called

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Reboot, Reset

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Id

ID of the server to be restarted

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
