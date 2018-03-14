---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---

# Set-HetznerCloudFloatingIp

## SYNOPSIS

{{Fill in the Synopsis}}

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

{{Fill in the Description}}

## EXAMPLES

### Example 1

```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -Description

{{Fill Description Description}}

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

### -IPAddress

{{Fill IPAddress Description}}

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
