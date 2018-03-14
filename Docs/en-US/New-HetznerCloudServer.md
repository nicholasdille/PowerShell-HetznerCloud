---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---

# New-HetznerCloudServer

## SYNOPSIS

Creates a new server in the Hetzner Cloud

## SYNTAX

### ByDatacenter

```powershell
New-HetznerCloudServer -Name <String> -Type <String> -Image <String> -SshKey <String[]> [-Datacenter <String>] [-NoStartAfterCreate] [<CommonParameters>]
```

### ByLocation

```powershell
New-HetznerCloudServer -Name <String> -Type <String> -Image <String> -SshKey <String[]> [-Location <String>] [-NoStartAfterCreate] [<CommonParameters>]
```

## DESCRIPTION

Creates a new server in the Hetzner Cloud based on the specified data. The result is parsed into a custom type and displayed using a custom format.

## EXAMPLES

### Example 1

```powershell
PS C:\> New-HetznerCloudServer -Name test -Type cx11 -Image ubuntu-16.04 -SshKey default -Datacenter fsn1-dc8


id               : 540882
name             : test
status           : initializing
created          : 28.02.2018 15:42:13
public_net       : @{ipv4=; ipv6=; floating_ips=System.Object[]}
server_type      : @{id=1; name=cx11; description=CX11; cores=1; memory=2; disk=20; prices=System.Object[]; storage_type=local}
datacenter       : @{id=1; name=fsn1-dc8; description=Falkenstein 1 DC 8; location=; server_types=}
image            : @{id=1; type=system; status=available; name=ubuntu-16.04; description=Ubuntu 16.04; image_size=; disk_size=5; created=15.01.2018 12:34:45; created_from=; bound_to=;
                   os_flavor=ubuntu; os_version=16.04; rapid_deploy=True}
iso              :
rescue_enabled   : False
locked           : False
backup_window    :
outgoing_traffic : 0
ingoing_traffic  : 0
included_traffic : 21990232555520
```

Creates a new server called `test` of type `cx11` in the datacenter `fsn1-dc8` based on image `ubuntu-16.04` and with the SSH key 4148.

## PARAMETERS

### -Datacenter

The datacenter to create the server in

```yaml
Type: String
Parameter Sets: ByDatacenter
Aliases:
Accepted values: fsn1-dc8, nbg1-dc3

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Image

The image to base the server on

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: ubuntu-16.04, debian-9, centos-7, fedora-27

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Location

The location to create the server in

```yaml
Type: String
Parameter Sets: ByLocation
Aliases:
Accepted values: fsn1, nbg1

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name

The name of the new server

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoStartAfterCreate

Wether to create the server without starting it

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SshKey

A list of SSH key names to authenticate with

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Type

The type of the new server

```yaml
Type: String
Parameter Sets: (All)
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

### HetznerCloudServer
