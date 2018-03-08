---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---

# Disable-HetznerCloudServerRescue

## SYNOPSIS

Disable the rescue system for a server in the Hetzner Cloud

## SYNTAX

```powershell
Disable-HetznerCloudServerRescue [-Id] <Int32[]> [<CommonParameters>]
```

## DESCRIPTION

When the rescue system is disabled, the server will boot normally the next time it is restarted

## EXAMPLES

### Example 1

```powershell
PS C:\> Disable-HetznerCloudServerRescue -Id 541232

action
------
@{id=336703; command=disable_rescue; status=running; progress=0; started=2018-03-08T14:09:16+00:00; finished=; resou...
```

Disable the rescue system for all servers

### Example 2

```powershell
PS C:\> Get-HetznerCloudServer | Disable-HetznerCloudServerRescue

action
------
@{id=336703; command=disable_rescue; status=running; progress=0; started=2018-03-08T14:09:16+00:00; finished=; resou...
```

Disable the rescue system for all servers

## PARAMETERS

### -Id

ID of the server to disable the rescue system for

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
