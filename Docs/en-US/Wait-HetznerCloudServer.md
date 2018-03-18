---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---

# Wait-HetznerCloudServer

## SYNOPSIS

Wait for an action on a server to finish in the Hetzner Cloud

## SYNTAX

```powershell
Wait-HetznerCloudServer [-Id] <Int32> [-Status] <String> [<CommonParameters>]
```

## DESCRIPTION

This cmdlet waits until the server reaches the state "Running" or "Off". It can be used to wait for an action to finish.

## EXAMPLES

### Example 1

```powershell
PS C:\> Wait-HetznerCloudServer -Id 571630 -Status Running
```

Wait for the specified server to reach the running state

## PARAMETERS

### -Id

ID of the server

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

### -Status

Status of the server to wait for

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Running, Off

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
