targetScope = 'resourceGroup'

param location string
param project string

param identifier string

module appServicePlan 'modules/appServicePlan.bicep' = {
	name: 'appServicePlan'
	params: {
		location: location
		project: project
		identifier: identifier
	}
}

module appService 'modules/appService.bicep' = {
	name: 'appService'
	params: {
		location: location
		project: project
		identifier: identifier
		planId: appServicePlan.outputs.appServicePlanId
	}
}

output appServiceName string = appService.outputs.appServiceName