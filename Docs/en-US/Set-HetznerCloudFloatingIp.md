---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---

# Set-HetznerCloudFloatingIp

## SYNOPSIS

Update the description or (re)sets the hostname of a floating IP in the Hetzner Cloud

## SYNTAX

### SetDescription

```powershell
Set-HetznerCloudFloatingIp -Id <Int32> -Description <String> [<CommonParameters>]
```

### SetDnsPtr

```powershell
Set-HetznerCloudFloatingIp -Id <Int32> -IPAddress <String> [-Hostname <String>]
 [<CommonParameters>]
```

## DESCRIPTION

This cmdlet sets or updates the description and set or resets the hostname of a floating IP.

## EXAMPLES

### Example 1

```powershell
PS C:\> Set-HetznerCloudFloatingIp -Id 4053 -Description 'test'


id            : 4053
description   : test
ip            : 78.46.231.143
type          : ipv4
server        : 566170
dns_ptr       : {@{ip=78.46.231.143; dns_ptr=static.143.231.46.78.clients.your-server.de}}
home_location : @{id=1; name=fsn1; description=Falkenstein DC Park 1; country=DE; city=Falkenstein; latitude=50,47612;
                longitude=12,370071}
blocked       : False
```

Updates the description of the specified floating IP

### Example 2

```powershell
PS C:\> Set-HetznerCloudFloatingIp -Id 4053 -IPAddress 78.46.231.143 -Hostname myhost.mydomain.com

action
------
@{id=397945; command=change_dns_ptr; status=running; progress=0; started=2018-03-14T20:51:27+00:00; finished=; resou...
```

Updates the hostname for the specified IP address

### Example 3

```powershell
PS C:\> Set-HetznerCloudFloatingIp -Id 4053 -IPAddress 78.46.231.143

action
------
@{id=397954; command=change_dns_ptr; status=running; progress=0; started=2018-03-14T20:53:06+00:00; finished=; resou...
```

Resets the hostname for the specified IP address

## PARAMETERS

### -Description

Description to be set on a floating IP

```yaml
Type: String
Parameter Sets: SetDescription
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Hostname

Hostname to set on a floating IP. If omitted, the hostname if reset to the default value provided by the Hetzner Cloud

```yaml
Type: String
Parameter Sets: SetDnsPtr
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IPAddress

IP address of the floating IP to set a hostname for

```yaml
Type: String
Parameter Sets: SetDnsPtr
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Id

ID of the floating IP to modify

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
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
