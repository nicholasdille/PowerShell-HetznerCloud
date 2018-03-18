---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---

# Get-HetznerCloudServerMetric

## SYNOPSIS

Retrieves metrics for a server in the Hetzner Cloud

## SYNTAX

```powershell
Get-HetznerCloudServerMetric [-Id] <String> [-Type] <String[]> [-Start] <String> [-End] <String> [-Interval] <Int32>] [<CommonParameters>]
```

## DESCRIPTION

This cmdlet retrieves one or more metric for the specified server and the specified time interval.

## EXAMPLES

### Example 1

```powershell
PS C:\> Get-HetznerCloudServerMetric -Name blarg -Type CPU,Disk,Network -Start '2018-03-18T10:00:00Z' -End '2018-03-18T14:00:00Z'

Start                : 18.03.2018 11:00:00
End                  : 18.03.2018 15:00:00
Steps                : 144
Cpu                  : {@{Timestamp=1521372960; Value=100.18175856837048}, @{Timestamp=1521373104; Value=0.4968861422462811}, @{Timestamp=1521373248;
                       Value=0}, @{Timestamp=1521373392; Value=0}...}
Disk0IopsRead        : {@{Timestamp=1521373968; Value=0}, @{Timestamp=1521374112; Value=0}, @{Timestamp=1521374256; Value=0}, @{Timestamp=1521374400;
                       Value=0}...}
Disk0IopsWrite       : {@{Timestamp=1521373968; Value=0.1360544217687075}, @{Timestamp=1521374112; Value=0}, @{Timestamp=1521374256; Value=0},
                       @{Timestamp=1521374400; Value=0.034013605442176874}...}
Disk0BandwidthRead   : {@{Timestamp=1521373968; Value=0}, @{Timestamp=1521374112; Value=0}, @{Timestamp=1521374256; Value=0}, @{Timestamp=1521374400;
                       Value=0}...}
Disk0BandwidthWrite  : {@{Timestamp=1521373968; Value=35456.87074829932}, @{Timestamp=1521374112; Value=0}, @{Timestamp=1521374256; Value=0},
                       @{Timestamp=1521374400; Value=208.97959183673473}...}
Network0PpsIn        : {@{Timestamp=1521373968; Value=0.11904761904761905}, @{Timestamp=1521374112; Value=0.03527336860670194}, @{Timestamp=1521374256;
                       Value=0.08503401360544217}, @{Timestamp=1521374400; Value=0.1360544217687075}...}
Network0PpsOut       : {@{Timestamp=1521373968; Value=0.10204081632653063}, @{Timestamp=1521374112; Value=0.03527336860670194}, @{Timestamp=1521374256;
                       Value=0.08503401360544217}, @{Timestamp=1521374400; Value=0.11904761904761905}...}
Network0BandwidthIn  : {@{Timestamp=1521373968; Value=7.840136054421769}, @{Timestamp=1521374112; Value=1.693121693121693}, @{Timestamp=1521374256;
                       Value=4.591836734693877}, @{Timestamp=1521374400; Value=8.299319727891156}...}
Network0BandwidthOut : {@{Timestamp=1521373968; Value=7.057823129251701}, @{Timestamp=1521374112; Value=1.693121693121693}, @{Timestamp=1521374256;
                       Value=4.183673469387755}, @{Timestamp=1521374400; Value=6.63265306122449}...}
```

Retrieves all metrics for the specified server

## PARAMETERS

### -End

End of the time interval

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Id

ID of the server to retrieve metrics for

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

### -Interval

Granularity of the retrieved metrics

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Start

Start of the time interval

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Type

Type of metric(s) to retrieve

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:
Accepted values: CPU, Disk, Network

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
