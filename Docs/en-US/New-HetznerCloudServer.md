---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---

# New-HetznerCloudServer

## SYNOPSIS
{{Fill in the Synopsis}}

## SYNTAX

### ByDatacenter
```
New-HetznerCloudServer -Name <String> -Type <String> -Image <String> -SshKey <Int32[]> [-Datacenter <String>]
 [-NoStartAfterCreate] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ByLocation
```
New-HetznerCloudServer -Name <String> -Type <String> -Image <String> -SshKey <Int32[]> [-Location <String>]
 [-NoStartAfterCreate] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Datacenter
{{Fill Datacenter Description}}

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
{{Fill Image Description}}

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
{{Fill Location Description}}

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
{{Fill Name Description}}

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
{{Fill NoStartAfterCreate Description}}

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
{{Fill SshKey Description}}

```yaml
Type: Int32[]
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Type
{{Fill Type Description}}

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

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

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

## NOTES

## RELATED LINKS
