---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---

# Disable-HetznerCloudServerBackup

## SYNOPSIS

Disable backups for a server in the Hetzner Cloud

## SYNTAX

```powershell
Disable-HetznerCloudServerBackup [-Id] <Int32> [<CommonParameters>]
```

## DESCRIPTION

Disabling backups also deletes all existing backups for a server

## EXAMPLES

### Example 1

```powershell
PS C:\> Disable-HetznerCloudServerBackup -Id 541232

action
------
@{id=336463; command=disable_backup; status=success; progress=0; started=2018-03-08T13:56:01+00:00; finished=2018-03...
```

Disables backups for a server

### Example 2

```powershell
PS C:\> Get-HetznerCloudServer | Disable-HetznerCloudServerBackup

action
------
@{id=336463; command=disable_backup; status=success; progress=0; started=2018-03-08T13:56:01+00:00; finished=2018-03...
```

Disables backups for all servers

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None


## OUTPUTS

### System.Object
