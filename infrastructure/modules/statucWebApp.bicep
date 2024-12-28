param location string
param project string
param identifier string

resource swa 'Microsoft.Web/staticSites@2022-09-01' = {
  name: '${project}-swa-${identifier}'
  location: location
  
  sku: {
    name: 'Free'
  }  

  properties: {} 
}

output swaName string = swa.name