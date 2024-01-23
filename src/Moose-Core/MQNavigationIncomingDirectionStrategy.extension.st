Extension { #name : #MQNavigationIncomingDirectionStrategy }

{ #category : #'*Moose-Core' }
MQNavigationIncomingDirectionStrategy class >> dependenciesAtReceiverScopeOf: anEntity [
	^ anEntity allClientsAtMyScope
]

{ #category : #'*Moose-Core' }
MQNavigationIncomingDirectionStrategy class >> dependenciesOf: aMooseEntity [
	^ aMooseEntity query incoming objects dependencies
]
