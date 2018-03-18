---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---

# Restore-HetznerCloudServer

## SYNOPSIS

Restore a server from an image in the Hetzner Cloud

## SYNTAX

```powershell
Restore-HetznerCloudServer [-Id] <Int32> [-Image] <Int32> [<CommonParameters>]
```

## DESCRIPTION

This cmdlet restores a server from an image. The image can be a snapshot or backup previously created from a server or it can be a system image provided by Hetzner.

## EXAMPLES

### Example 1

```powershell
PS C:\> Restore-HetznerCloudServer -Id 571630 -Image 1

action                                                                                                                                      root_password
------                                                                                                                                      -------------
@{id=456575; command=rebuild_server; status=running; progress=0; started=18.03.2018 12:40:42; finished=; resources=System.Object[]; error=}
```

Restores a server

## PARAMETERS

### -Id

ID of the server to be restored

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

### -Image

ID of the image to use for restoring the server

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
