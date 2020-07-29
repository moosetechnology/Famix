Extension { #name : #MQNavigationOutgoingDirectionStrategy }

{ #category : #'*Moose-Core' }
MQNavigationOutgoingDirectionStrategy classSide >> dependenciesAtReceiverScopeOf: anEntity [
	^ anEntity allProviders
]

{ #category : #'*Moose-Core' }
MQNavigationOutgoingDirectionStrategy classSide >> dependenciesOf: aMooseEntity [
	^ aMooseEntity query outgoing objects dependencies
]
