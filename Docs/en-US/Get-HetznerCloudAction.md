---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---

# Get-HetznerCloudAction

## SYNOPSIS

Retrieve actions performed on your infrastructure in the Hetzner Cloud

## SYNTAX

### None (Default)

```powershell
Get-HetznerCloudAction [<CommonParameters>]
```

### ById

```powershell
Get-HetznerCloudAction [-Id <String>] [<CommonParameters>]
```

## DESCRIPTION

Whenever you make changes to your infrastructure in the Hetzner Cloud, an action is created which tracks and documents the change. This cmdlet retrieves them.

## EXAMPLES

### Example 1

```powershell
PS C:\> Get-HetznerCloudAction

id        : 100580
command   : assign_floating_ip
status    : success
progress  : 100
started   : 2018-02-06T16:49:57+00:00
finished  : 2018-02-06T16:50:00+00:00
resources : {@{id=506843; type=server}, @{id=939; type=floating_ip}}
error     :
```

Retrieves a list of all action on your Hetzner Cloud infrastructure

### Example 2

```powershell
PS C:\> Get-HetznerCloudAction -Id 100580

id        : 100580
command   : assign_floating_ip
status    : success
progress  : 100
started   : 2018-02-06T16:49:57+00:00
finished  : 2018-02-06T16:50:00+00:00
resources : {@{id=506843; type=server}, @{id=939; type=floating_ip}}
error     :
```

Retrieves a single action on your Hetzner Cloud infrastructure

## PARAMETERS

### -Id

ID of the action to retrieve

```yaml
Type: String
Parameter Sets: ById
Aliases:

Required: False
Position: Named
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
