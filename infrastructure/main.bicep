targetScope = 'resourceGroup'

param location string
param project string
param swaLocation string

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
		planId: appServicePlan.outputs.planId
	}
}

module staticWebApp 'modules/staticWebApp.bicep' = {
  name: 'staticWebApp'
  params: {
    location: swaLocation
    project: project
    identifier: identifier
  }
}

output appServiceName string = appService.outputs.appServiceName
output staticWebAppName string = staticWebApp.outputs.swaName