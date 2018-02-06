---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---
# Remove-HetznerCloudSshKey

## SYNOPSIS

Removes a SSH public key

## SYNTAX

```
Remove-HetznerCloudSshKey [-Id] <Int32[]> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION

This cmdlet removes a SSH key from the Hetzner Cloud

## EXAMPLES

### Example 1

```powershell
PS C:\> Remove-HetznerCloudSshKey -Id 1841
```

Removes a SSH public key with the given internal ID.

### Example 2

```powershell
PS C:\> Get-HetznerCloudSshKey | Remove-HetznerCloudSshKey
```

Removes all SSH public keys provided by `Get-HetznerCloudSshKey`

## PARAMETERS

### -Id

{{Fill Id Description}}

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

## RELATED LINKS

Add-HetznerCloudSshKey
Get-HetznerCloudSshKey
New-HetznerCloudServer
Enable-HetznerCloudServerRescue
