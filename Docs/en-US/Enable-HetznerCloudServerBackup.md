---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---

# Enable-HetznerCloudServerBackup

## SYNOPSIS

Enable backups for a server in the Hetzner Cloud

## SYNTAX

```powershell
Enable-HetznerCloudServerBackup [-Id] <Int32> [-Timeslot] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION

When backups are enable for a server, it will cost extra due to the addition storage requirement

## EXAMPLES

### Example 1

```powershell
PS C:\> PS C:\Users\ndille> Enable-HetznerCloudServerBackup -Id 541232 -Timeslot '02-06'

action
------
@{id=336450; command=enable_backup; status=success; progress=0; started=2018-03-08T13:55:05+00:00; finished=2018-03-...
```

Enables backup for a server

### Example 2

```powershell
PS C:\> PS C:\Users\ndille> Get-HetznerCloudServer | Enable-HetznerCloudServerBackup -Timeslot '02-06'

action
------
@{id=336450; command=enable_backup; status=success; progress=0; started=2018-03-08T13:55:05+00:00; finished=2018-03-...
```

Enables backup for all servers

## PARAMETERS

### -Id

ID of the server to enable backups for

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

### -Timeslot

Timeslotfor backup

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: 22-02, 02-06, 06-10, 10-14, 14-18, 18-22

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
