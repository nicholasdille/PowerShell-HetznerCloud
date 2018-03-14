---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---
# New-HetznerCloudFloatingIp

## SYNOPSIS

Reserves a new floating IP

## SYNTAX

### ByServer

```powershell
New-HetznerCloudFloatingIp -Type <String> [-Description <String>] -Server <String> [-Location <String>] [<CommonParameters>]
```

### ByLocation

```powershell
New-HetznerCloudFloatingIp -Type <String> [-Description <String>] -Location <String> [<CommonParameters>]
```

## DESCRIPTION

This cmdlet reserves a new floating IP and - optionally - assigns it to an existing server. Floating IPs have a home location for which routing is optimized but they can still be used for servers residing in other locations. The home location can be specific explicitly (`-Location`) or derived implicitly from the server (`-Server`). You can also set a home location different from the specified server by supplying bith parameters.

## EXAMPLES

### Example 1

```powershell
PS C:\> New-HetznerCloudFloatingIp -Type IPv4 -Location fsn1


id            : 937
description   :
ip            : 88.99.120.111
type          : ipv4
server        :
dns_ptr       : {@{ip=88.99.120.111; dns_ptr=static.111.120.99.88.clients.your-server.de}}
home_location : @{id=1; name=fsn1; description=Falkenstein DC Park 1; country=DE; city=Falkenstein; latitude=50,47612;
                longitude=12,370071}
blocked       : False
```

Creates a new floating IP in location `fsn1` without assigning it.

### Example 2

```powershell
PS C:\> New-HetznerCloudFloatingIp -Type IPv4 -Server 506843


id            : 938
description   :
ip            : 88.99.120.112
type          : ipv4
server        :
dns_ptr       : {@{ip=88.99.120.112; dns_ptr=static.112.120.99.88.clients.your-server.de}}
home_location : @{id=1; name=fsn1; description=Falkenstein DC Park 1; country=DE; city=Falkenstein; latitude=50,47612;
                longitude=12,370071}
blocked       : False
```

Creates a new floating IP in the location of server 506843.

### Example 3

```powershell
PS C:\> New-HetznerCloudFloatingIp -Type IPv4 -Server 506843 -Location nbg1


id            : 939
description   :
ip            : 94.130.189.12
type          : ipv4
server        :
dns_ptr       : {@{ip=94.130.189.12; dns_ptr=static.12.189.130.94.clients.your-server.de}}
home_location : @{id=2; name=nbg1; description=Nuremberg DC Park 1; country=DE; city=Nuremberg; latitude=49,452102;
                longitude=11,076665}
blocked       : False
```

Creates a new floating IP with home location `nbg1` and assigns it to a server

## PARAMETERS

### -Description

Description for the floating IP

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Location

Home location of the floating IP

```yaml
Type: String
Parameter Sets: ByServer
Aliases:
Accepted values: fsn1, nbg1

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: String
Parameter Sets: ByLocation
Aliases:
Accepted values: fsn1, nbg1

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Server

Assigns the floating IP to a server

```yaml
Type: String
Parameter Sets: ByServer
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Type

Type of the floating IP

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: IPv4, IPv6

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

### None
