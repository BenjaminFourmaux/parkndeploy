targetScope = 'resourceGroup'

param location string
param project string

param identifier string

module appServicePlan 'module/appServicePlan.bicep' = {
	name: 'appServicePlan'
	params: {
		location: location
		project: project
		identifier: identifier
	}
}

module appService 'module/appService.bicep' = {
	name: 'appService'
	params: {
		location: location
		project: project
		identifier: identifier
		planId: appServicePlan.outputs.appServicePlanId
	}
}

output appServiceName string = appService.outputs.appServiceName