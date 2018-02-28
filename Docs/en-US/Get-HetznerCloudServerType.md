---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---
# Get-HetznerCloudServerType

## SYNOPSIS

Retrieves information about server types

## SYNTAX

### None (Default)

```
Get-HetznerCloudServerType [<CommonParameters>]
```

### ById

```
Get-HetznerCloudServerType [-Id <String>] [<CommonParameters>]
```

## DESCRIPTION

The Hetzner Cloud supports a set of server types to cover difference workloads. The server types differ in the number of cores, memory and storage. The response is parsed into custom objects and displayed using the custom format `HetznerCloudServerType`.

## EXAMPLES

### Example 1

```powershell
PS C:\> Get-HetznerCloudServerType

Name      Cores Memory Storage StorageType
----      ----- ------ ------- -----------
cx11          1      2      20 local
cx11-ceph     1      2      20 network
cx21          2      4      40 local
cx21-ceph     2      4      40 network
cx31          2      8      80 local
cx31-ceph     2      8      80 network
cx41          4     16     160 local
cx41-ceph     4     16     160 network
cx51          8     32     240 local
cx51-ceph     8     32     240 network
```

The cmdlet produces a list of server types supported by the Hetzner Cloud.

### Example 2

```powershell
PS C:\> Get-HetznerCloudServerType | Format-List


Id          : 1
Name        : cx11
Cores       : 1
Memory      : 2
Storage     : 20
StorageType : local

Id          : 2
Name        : cx11-ceph
Cores       : 1
Memory      : 2
Storage     : 20
StorageType : network

Id          : 3
Name        : cx21
Cores       : 2
Memory      : 4
Storage     : 40
StorageType : local

#...
```

This call produces all available information for server types.

### Example 3

```powershell
PS C:\> Get-HetznerCloudServerType -Id 1

Name Cores Memory Storage StorageType
---- ----- ------ ------- -----------
cx11     1      2      20 local
```

This call produces informaton about a single server type.

## PARAMETERS

### -Id

{{Fill Id Description}}

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

### HetznerCloudServerType
