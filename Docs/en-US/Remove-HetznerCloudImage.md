---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---

# Remove-HetznerCloudImage

## SYNOPSIS

Removes an server image from the Hetzner Cloud

## SYNTAX

```powershell
Remove-HetznerCloudImage [-Id] <Int32[]> [<CommonParameters>]
```

## DESCRIPTION

This cmdlet removes an image that was previously created from a server.

## EXAMPLES

### Example 1

```powershell
PS C:\> Remove-HetznerCloudImage -Id 55520
```

Removes the specified image

## PARAMETERS

### -Id

ID of the image to be removed

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

## INPUTS

### System.Int32[]

## OUTPUTS

### System.Object
