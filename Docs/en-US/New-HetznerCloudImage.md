---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---

# New-HetznerCloudImage

## SYNOPSIS

Creates an image from a server in the Hetzner Cloud

## SYNTAX

```powershell
New-HetznerCloudImage [-Id] <Int32> [[-Type] <String>] [[-Description] <String>] [<CommonParameters>]
```

## DESCRIPTION

This cmdlet captures the current state of the server disks into an image. It can be used to create new servers with identical configuration and behaviour. The Hetzner Cloud will only capture the disks. If you are creating an image from a running server, you must make sure the disks are consistent. Otherwise shutdown the server before capturing its state.

## EXAMPLES

### Example 1

```powershell
PS C:\> New-HetznerCloudImage -Id 571630 -Type Snapshot -Description 'vanilla'

image
-----
@{id=55520; type=snapshot; status=creating; name=; description=vanilla; image_size=; disk_size=20; created=18.03.2018 12:37:37; created_from=; bound_to=; ...
```

Creates a snapshot image of the specified server

## PARAMETERS

### -Description

Description of the image to be created

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Id

ID of the image to be created

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Type

Backup images are only available if the backup option of a server is enabled. They will be removed with the server. Snapshot images are independent of a server and will survive server removal. They are charged separately.

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Snapshot, Backup

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

### None

## OUTPUTS

### System.Object
