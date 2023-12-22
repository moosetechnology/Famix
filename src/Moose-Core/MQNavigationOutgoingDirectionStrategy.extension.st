Extension { #name : #MQNavigationOutgoingDirectionStrategy }

{ #category : #'*Moose-Core' }
MQNavigationOutgoingDirectionStrategy class >> dependenciesAtReceiverScopeOf: anEntity [
	^ anEntity allProvidersAtMyScope
]

{ #category : #'*Moose-Core' }
MQNavigationOutgoingDirectionStrategy class >> dependenciesOf: aMooseEntity [
	^ aMooseEntity query outgoing objects dependencies
]
