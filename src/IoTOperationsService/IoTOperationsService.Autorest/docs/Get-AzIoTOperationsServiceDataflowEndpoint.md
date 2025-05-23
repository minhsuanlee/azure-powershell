---
external help file:
Module Name: Az.IoTOperationsService
online version: https://learn.microsoft.com/powershell/module/az.iotoperationsservice/get-aziotoperationsservicedataflowendpoint
schema: 2.0.0
---

# Get-AzIoTOperationsServiceDataflowEndpoint

## SYNOPSIS
Get a DataflowEndpointResource

## SYNTAX

### List (Default)
```
Get-AzIoTOperationsServiceDataflowEndpoint -InstanceName <String> -ResourceGroupName <String>
 [-SubscriptionId <String[]>] [-DefaultProfile <PSObject>] [<CommonParameters>]
```

### Get
```
Get-AzIoTOperationsServiceDataflowEndpoint -InstanceName <String> -Name <String> -ResourceGroupName <String>
 [-SubscriptionId <String[]>] [-DefaultProfile <PSObject>] [<CommonParameters>]
```

### GetViaIdentity
```
Get-AzIoTOperationsServiceDataflowEndpoint -InputObject <IIoTOperationsServiceIdentity>
 [-DefaultProfile <PSObject>] [<CommonParameters>]
```

### GetViaIdentityInstance
```
Get-AzIoTOperationsServiceDataflowEndpoint -InstanceInputObject <IIoTOperationsServiceIdentity> -Name <String>
 [-DefaultProfile <PSObject>] [<CommonParameters>]
```

## DESCRIPTION
Get a DataflowEndpointResource

## EXAMPLES

### Example 1: List DataflowEndpoints
```powershell
Get-AzIoTOperationsServiceDataflowEndpoint -InstanceName  "aio-3lrx4" -ResourceGroupName "aio-validation-117026523"
```

```output
Name                     SystemDataCreatedAt SystemDataCreatedBy                  SystemDataCreatedByType SystemDataLastModifiedAt SystemDataLast
                                                                                                                                   ModifiedBy
----                     ------------------- -------------------                  ----------------------- ------------------------ --------------
default                  3/5/2025 5:07:34 PM 739f5293-922a-4616-b106-3662530ef99f Application             3/5/2025 5:29:55 PM      319f651f-7ddb…
mqtt-dest                3/5/2025 5:17:17 PM 739f5293-922a-4616-b106-3662530ef99f Application             3/5/2025 5:29:55 PM      319f651f-7ddb…
mqtt-source-scale        3/5/2025 5:17:17 PM 739f5293-922a-4616-b106-3662530ef99f Application             3/5/2025 5:29:55 PM      319f651f-7ddb…
mqtt-source              3/5/2025 5:17:17 PM 739f5293-922a-4616-b106-3662530ef99f Application             3/5/2025 5:29:55 PM      319f651f-7ddb…
kafka-target             3/5/2025 5:18:06 PM 739f5293-922a-4616-b106-3662530ef99f Application             3/5/2025 5:29:55 PM      319f651f-7ddb…
eventgrid                3/5/2025 5:18:47 PM 739f5293-922a-4616-b106-3662530ef99f Application             3/5/2025 5:29:55 PM      319f651f-7ddb…
adx-dest                 3/5/2025 5:28:10 PM 739f5293-922a-4616-b106-3662530ef99f Application             3/5/2025 5:29:55 PM      319f651f-7ddb…
quickstart-mqtt-endpoint 3/5/2025 5:30:07 PM 739f5293-922a-4616-b106-3662530ef99f Application             3/5/2025 5:30:11 PM      319f651f-7ddb…
quickstart-eh-endpoint   3/5/2025 5:30:41 PM 739f5293-922a-4616-b106-3662530ef99f Application             3/5/2025 5:30:46 PM      319f651f-7ddb…
```

This command gets a list of dataflow endpoints

## PARAMETERS

### -DefaultProfile
The DefaultProfile parameter is not functional.
Use the SubscriptionId parameter when available if executing the cmdlet against a different subscription.

```yaml
Type: System.Management.Automation.PSObject
Parameter Sets: (All)
Aliases: AzureRMContext, AzureCredential

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
Identity Parameter

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.IoTOperationsService.Models.IIoTOperationsServiceIdentity
Parameter Sets: GetViaIdentity
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -InstanceInputObject
Identity Parameter

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.IoTOperationsService.Models.IIoTOperationsServiceIdentity
Parameter Sets: GetViaIdentityInstance
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -InstanceName
Name of instance.

```yaml
Type: System.String
Parameter Sets: Get, List
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Name of Instance dataflowEndpoint resource

```yaml
Type: System.String
Parameter Sets: Get, GetViaIdentityInstance
Aliases: DataflowEndpointName

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceGroupName
The name of the resource group.
The name is case insensitive.

```yaml
Type: System.String
Parameter Sets: Get, List
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SubscriptionId
The ID of the target subscription.
The value must be an UUID.

```yaml
Type: System.String[]
Parameter Sets: Get, List
Aliases:

Required: False
Position: Named
Default value: (Get-AzContext).Subscription.Id
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Microsoft.Azure.PowerShell.Cmdlets.IoTOperationsService.Models.IIoTOperationsServiceIdentity

## OUTPUTS

### Microsoft.Azure.PowerShell.Cmdlets.IoTOperationsService.Models.IDataflowEndpointResource

## NOTES

## RELATED LINKS

