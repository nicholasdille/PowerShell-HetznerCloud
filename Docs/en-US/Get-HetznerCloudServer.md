---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---

# Get-HetznerCloudServer

## SYNOPSIS

Retrieves servers from the Hetzner Cloud

## SYNTAX

### None (Default)

```powershell
Get-HetznerCloudServer [<CommonParameters>]
```

### ById

```powershell
Get-HetznerCloudServer [-Id <String>] [<CommonParameters>]
```

## DESCRIPTION

This cmdlet displays all existing servers in the Hetzner Cloud. The result is processed into into custom type.

## EXAMPLES

### Example 1

```powershell
PS C:\> Get-HetznerCloudServer

Name  Status  Type Datacenter
----  ------  ---- ----------
test  running cx11 fsn1-dc8
test2 running cx11 fsn1-dc8
```

Retrieves a list of available servers

### Example 2

```powershell
PS C:\> Get-HetznerCloudServer -Id 540903

Name  Status  Type Datacenter
----  ------  ---- ----------
test2 running cx11 fsn1-dc8
```

Retrieves a single server

### Example 3

```powershell
PS C:\> Get-HetznerCloudServer -Id 540903 | Format-List *Get-HetznerCloudServer -Id 540903 | Format-List *

Id           : 540903
Name         : test2
Status       : running
Created      : 28.02.2018 15:49:48
Type         : cx11
Datacenter   : fsn1-dc8
Location     : fsn1
Image        : ubuntu-16.04
Iso          :
RescueSystem : False
```

Displays all fields of a single server

## PARAMETERS

### -Id

ID of a single server to retrieve

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

### HetznerCloudServer
