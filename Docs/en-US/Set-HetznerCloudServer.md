---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---

# Set-HetznerCloudServer

## SYNOPSIS

Modifies properties of a server in the Hetzner Cloud

## SYNTAX

### SetName

```powershell
Set-HetznerCloudServer -Id <Int32> -Name <String> [<CommonParameters>]
```

### SetType

```powershell
Set-HetznerCloudServer -Id <Int32> -Type <String> [-AllowDowngrade] [<CommonParameters>]
```

### SetDnsPtr

```powershell
Set-HetznerCloudServer -Id <Int32> -PrimaryIp <String> [-Hostname <String>]
 [<CommonParameters>]
```

## DESCRIPTION

This cmdlet modified one of the following: the name of a server, the type of a server or it (re)sets the hostname of an assigned IP address.

## EXAMPLES

### Example 1

```powershell
PS C:\> Set-HetznerCloudServer -Id 571630 -Name 'blarg'

id               : 571630
name             : blarg
status           : running
created          : 18.03.2018 12:34:43
public_net       : @{ipv4=; ipv6=; floating_ips=System.Object[]}
server_type      : @{id=1; name=cx11; description=CX11; cores=1; memory=2; disk=20; prices=System.Object[]; storage_type=local}
datacenter       : @{id=1; name=fsn1-dc8; description=Falkenstein 1 DC 8; location=; server_types=}
image            : @{id=1; type=system; status=available; name=ubuntu-16.04; description=Ubuntu 16.04; image_size=; disk_size=5; created=15.01.2018
                   12:34:45; created_from=; bound_to=; os_flavor=ubuntu; os_version=16.04; rapid_deploy=True}
iso              :
rescue_enabled   : False
locked           : False
backup_window    :
outgoing_traffic : 0
ingoing_traffic  : 0
included_traffic : 21990232555520
```

Sets the name of the specified server

### Example 2

```powershell
PS C:\> Set-HetznerCloudServer -Id 571630 -Type cx21 -AllowDowngrade

action
------
@{id=456611; command=shutdown_server; status=running; progress=0; started=18.03.2018 12:46:11; finished=; resources=System.Object[]; error=}
@{id=456612; command=change_server_type; status=running; progress=0; started=18.03.2018 12:46:12; finished=; resources=System.Object[]; error=}
```

Sets the name of the specified server

### Example 3

```powershell
PS C:\> Set-HetznerCloudServer -Id 571630 -Type cx31

action
------
@{id=456636; command=shutdown_server; status=running; progress=0; started=18.03.2018 12:49:27; finished=; resources=System.Object[]; error=}
@{id=456637; command=change_server_type; status=running; progress=0; started=18.03.2018 12:49:29; finished=; resources=System.Object[]; error=}
```

Sets the name of the specified server

### Example 4

```powershell
PS C:\> Set-HetznerCloudServer -Id 571630 -PrimaryIp 78.47.87.208 -Hostname test.mydomain.com

action
------
@{id=456671; command=change_dns_ptr; status=running; progress=0; started=18.03.2018 12:53:58; finished=; resources=System.Object[]; error=}

PS C:\> Get-HetznerCloudServer | Format-List

Id           : 571630
Name         : blarg
Status       : running
Created      : 18.03.2018 12:34:43
Type         : cx31
Datacenter   : fsn1-dc8
Location     : fsn1
Image        : ubuntu-16.04
IPAddress    : 78.47.87.208
DnsPtr       : test.mydomain.com
Iso          :
Backup       :
RescueSystem : False
```

Sets the reverse DNS entry of the specified server

### Example 4

```powershell
PS C:\> Set-HetznerCloudServer -Id 571630 -PrimaryIp 78.47.87.208

action
------
@{id=456683; command=change_dns_ptr; status=running; progress=0; started=18.03.2018 12:55:54; finished=; resources=System.Object[]; error=}


PS C:\Program Files\PowerShell\6.0.0> Get-HetznerCloudServer | Format-List

Id           : 571630
Name         : blarg
Status       : running
Created      : 18.03.2018 12:34:43
Type         : cx31
Datacenter   : fsn1-dc8
Location     : fsn1
Image        : ubuntu-16.04
IPAddress    : 78.47.87.208
DnsPtr       : static.208.87.47.78.clients.your-server.de
Iso          :
Backup       :
RescueSystem : False
```

Resets the reverse DNS entry of the specified server

## PARAMETERS

### -AllowDowngrade

Whether the server type can be downgraded after an update

```yaml
Type: SwitchParameter
Parameter Sets: SetType
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Hostname

Hostname for the reverse DNS entry

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

### -Id

ID of the server to modify

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

### -Name

Name to be set for the specified server

```yaml
Type: String
Parameter Sets: SetName
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PrimaryIp

IP address for which the reverse DNS entry is to be (re)set

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

### -Type

Type to upgrade/downgrade the specified server to

```yaml
Type: String
Parameter Sets: SetType
Aliases:
Accepted values: cx11, cx11-ceph, cx21, cx21-ceph, cx31, cx31-ceph, cx41, cx41-ceph, cx51, cx51-ceph

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
