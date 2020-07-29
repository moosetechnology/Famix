Extension { #name : #MQNavigationIncomingDirectionStrategy }

{ #category : #'*Moose-Core' }
MQNavigationIncomingDirectionStrategy classSide >> dependenciesAtReceiverScopeOf: anEntity [
	^ anEntity allClients
]

{ #category : #'*Moose-Core' }
MQNavigationIncomingDirectionStrategy classSide >> dependenciesOf: aMooseEntity [
	^ aMooseEntity query incoming objects dependencies
]
