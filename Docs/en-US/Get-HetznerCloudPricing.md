---
external help file: HetznerCloud-help.xml
Module Name: HetznerCloud
online version:
schema: 2.0.0
---
# Get-HetznerCloudPricing

## SYNOPSIS

Retrieves priving information

## SYNTAX

```
Get-HetznerCloudPricing [<CommonParameters>]
```

## DESCRIPTION

This cmdlet retrives information about the pricing for server types, server backup, images, traffic and floating IPs including currency and VAT.

## EXAMPLES

### Example 1

```powershell
PS C:\> Get-HetznerCloudPricing


currency      : EUR
vat_rate      : 19.000000
image         : @{price_per_gb_month=}
floating_ip   : @{price_monthly=}
traffic       : @{price_per_tb=}
server_backup : @{percentage=20.0000000000}
server_types  : {@{id=1; name=cx11; prices=System.Object[]}, @{id=2; name=cx11-ceph; prices=System.Object[]}, @{id=3;
                name=cx21; prices=System.Object[]}, @{id=4; name=cx21-ceph; prices=System.Object[]}...}
```

The pricing information for all elements of the Hetzner Cloud.

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### hashtable

## RELATED LINKS

Get-HetznerCloudDatacenter
Get-HetznerCloudLocation
Get-HetznerCloudServerType
Get-HetznerCloudImage
Get-HetznerCloudIso
