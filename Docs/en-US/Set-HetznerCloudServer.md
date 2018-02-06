---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---

# Set-HetznerCloudServer

## SYNOPSIS
{{Fill in the Synopsis}}

## SYNTAX

### SetName
```
Set-HetznerCloudServer -Id <Int32> -Name <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

### SetType
```
Set-HetznerCloudServer -Id <Int32> -Type <String> [-AllowDowngrade] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### SetDnsPtr
```
Set-HetznerCloudServer -Id <Int32> -PrimaryIp <String> [-Hostname <String>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
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

### -AllowDowngrade
{{Fill AllowDowngrade Description}}

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

### -Hostname
{{Fill Hostname Description}}

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
{{Fill Id Description}}

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
{{Fill Name Description}}

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
{{Fill PrimaryIp Description}}

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
{{Fill Type Description}}

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
