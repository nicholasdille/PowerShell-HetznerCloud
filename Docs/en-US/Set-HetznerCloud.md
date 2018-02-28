---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---
# Set-HetznerCloud

## SYNOPSIS

Set authentication information

## SYNTAX

```
Set-HetznerCloud [-Token] <String> [<CommonParameters>]
```

## DESCRIPTION

This cmdlet stores authentication information in the context of the module for use by `Invoke-HetznerCloudApi`. The information is read by `Get-HetznerCloud`.

## PARAMETERS

### -Token

The API token for the Hetzner Cloud as retrieved from the web console.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).
