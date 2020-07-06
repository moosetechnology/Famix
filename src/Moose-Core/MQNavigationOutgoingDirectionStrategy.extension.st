Extension { #name : #MQNavigationOutgoingDirectionStrategy }

{ #category : #'*Moose-Core' }
MQNavigationOutgoingDirectionStrategy class >> dependenciesAtReceiverScopeOf: anEntity [
	^ anEntity allProviders
]

{ #category : #'*Moose-Core' }
MQNavigationOutgoingDirectionStrategy class >> dependenciesOf: aMooseEntity [
	^ aMooseEntity query outgoing dependencies
]
