---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---

# Remove-HetznerCloudServer

## SYNOPSIS

Removes a server from the Hetzner Cloud

## SYNTAX

```powershell
Remove-HetznerCloudServer [-Id] <Int32[]> [<CommonParameters>]
```

## DESCRIPTION

This cmdlet removes a server from the Hetzner Cloud

## EXAMPLES

### Example 1

```powershell
PS C:\> Remove-HetznerCloudServer -Id 540903

action
------
@{id=263228; command=delete_server; status=success; progress=100; started=28.02.2018 16:03:45; finished=28.02.2018 16:03:45; resources=System.Object[]; error=}
```

Removes a specific server from the Hetzner Cloud

## PARAMETERS

### -Id

The ID of a server to retrieve

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
