---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---

# Set-HetznerCloudSshKey

## SYNOPSIS

Sets the name of an SSH key in the Hetzner Cloud

## SYNTAX

```powershell
Set-HetznerCloudSshKey [-Id] <Int32> [-Name] <String> [<CommonParameters>]
```

## DESCRIPTION

This cmdlet set or changes the name of an SSH key.

## EXAMPLES

### Example 1

```powershell
PS C:\> Set-HetznerCloudSshKey -Id 8414 -Name 'default'
```

Sets the name of the specified SSH key

## PARAMETERS

### -Id

ID of the SSH key to set the name for

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

### -Name

Name to set for the specified SSH key

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
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
