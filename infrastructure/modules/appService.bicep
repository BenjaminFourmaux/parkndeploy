param location string
param project string
param identifier string

param planId string

resource app 'Microsoft.Web/sites@2022-03-01' = {
	name: '${project}-app-${identifier}'
	location: location

	properties: {
		serverFarmId: planId
		reserved: true

		siteConfig: {
			linuxFxVersion: 'DOTNETCORE|8.0'
		}
	}
}

output appServiceName string = app.name