---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---
# Invoke-HetznerCloudApi

## SYNOPSIS

Wrapper for the API of the Hetzner Cloud

## SYNTAX

```
Invoke-HetznerCloudApi [-Api] <String> [[-Id] <Int32>] [[-Action] <String>] [[-ActionId] <Int32>]
 [[-CustomAction] <String>] [[-Method] <WebRequestMethod>] [[-Payload] <Hashtable>] [[-PageSize] <Int32>]
 [<CommonParameters>]
```

## DESCRIPTION

This cmdlet implements authentication and pagination for the API of the Hetzner Cloud. It is not exposed but only used internally by other cmdlets in this module.


## PARAMETERS

### -Action

The specified action is used in an URI of the form `/<api>/<id>/actions/<action>` to execute an action on a specific item

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

### -ActionId

The specified action ID is used in an URI of the form `/<api>/<id>/actions/<actionid>` to retrieve or modify a single action item

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Api

The specified API is used in an URI of the form `/<api>` to retrieve or modify items or the same topic

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

### -CustomAction

The specified API is used in an URI of the form `/<api>/<id>/<customaction>` to execute an action on a single item

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Id

The specified API is used in an URI of the form `/<api>/<id>` to retrieve or modify a single item

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Method

The HTTP method to use when operating the API

```yaml
Type: WebRequestMethod
Parameter Sets: (All)
Aliases:
Accepted values: Default, Get, Head, Post, Put, Delete, Trace, Options, Merge, Patch

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PageSize

How many items per page to retrieve

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Payload

The payload to send in the body of an HTTP request

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## RELATED LINKS

Get-HetznerCloud
Set-HetznerCloud
