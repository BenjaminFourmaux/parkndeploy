param location string
param project string
param identifier string

resource plan 'Microsoft.Web/serverfarms@2022-09-01' = {
	name: '${project}-plan-${identifier}'
	location: location

	sku: {
		name: 'Standard'
		tier: 'Standard'
	}

	kind: 'app,linux'

	properties: {
		reserved: true
	}
}

output planId string = plan.id