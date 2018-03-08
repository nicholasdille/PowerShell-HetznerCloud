---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---

# Enable-HetznerCloudServerRescue

## SYNOPSIS

Enable the rescue system for a server in the Hetzner Cloud

## SYNTAX

```powershell
Enable-HetznerCloudServerRescue [-Id] <Int32[]> [[-Type] <String>] [[-SshKey] <Int32[]>] [<CommonParameters>]
```

## DESCRIPTION

When the rescue system is enabled for a server, it will boot into the rescue system the next time it restarts. If so SSH key is specified, a random password will be generated and returned by the call.

## EXAMPLES

### Example 1

```powershell
PS C:\> PS C:\Users\ndille> Enable-HetznerCloudServerRescue -Id 541232 -SshKey 8414

root_password        action
-------------        ------
igVi3KhVifKMAsd4JhhH @{id=336711; command=enable_rescue; status=running; progress=0; started=2018-03-08T14:10:16+00:...
```

Enable the rescue system for all servers

### Example 2

```powershell
PS C:\> Get-HetznerCloudServer | Enable-HetznerCloudServerRescue

root_password        action
-------------        ------
LuhHWFwhhd3CfukiukLi @{id=336684; command=enable_rescue; status=running; progress=0; started=2018-03-08T14:07:19+00:...
```

Enable the rescue system for all servers

## PARAMETERS

### -Id

ID of the server to boot into the rescue system

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

### -SshKey

SSH key to allow access to the rescue system

```yaml
Type: Int32[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Type

The type of rescue system to boot into

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: linux64, linux32, freebsd64

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Int32[]


## OUTPUTS

### System.Object
