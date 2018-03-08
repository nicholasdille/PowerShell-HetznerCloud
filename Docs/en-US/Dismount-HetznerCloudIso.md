---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---

# Dismount-HetznerCloudIso

## SYNOPSIS

Unmounted an ISO from a server in the Hetzner Cloud

## SYNTAX

```powershell
Dismount-HetznerCloudIso [-Id] <Int32> [<CommonParameters>]
```

## DESCRIPTION

{{Fill in the Description}}

## EXAMPLES

### Example 1

```powershell
PS C:\> Dismount-HetznerCloudIso -Id 555995

action
------
@{id=336842; command=detach_iso; status=running; progress=0; started=2018-03-08T14:19:43+00:00; finished=; resources...
```

Unmount ISO from a server

## PARAMETERS

### -Id

ID of the server to unmount the ISO from

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
