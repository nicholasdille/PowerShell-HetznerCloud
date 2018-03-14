---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---

# Get-HetznerCloudServerAction

## SYNOPSIS

{{Fill in the Synopsis}}

## SYNTAX

```powershell
Get-HetznerCloudServerAction [-Id] <Int32[]> [<CommonParameters>]
```

## DESCRIPTION

{{Fill in the Description}}

## EXAMPLES

### Example 1

```powershell
PS C:\> Get-HetznerCloudServerAction -Id 566170

id        : 397789
command   : create_server
status    : running
progress  : 0
started   : 2018-03-14T20:27:30+00:00
finished  :
resources : {@{id=566170; type=server}}
error     :
```

Retrieves actions for the server with the specified ID

## PARAMETERS

### -Id

ID to retrieve actions for

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
