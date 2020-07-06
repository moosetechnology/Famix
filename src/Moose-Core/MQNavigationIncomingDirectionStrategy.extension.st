Extension { #name : #MQNavigationIncomingDirectionStrategy }

{ #category : #'*Moose-Core' }
MQNavigationIncomingDirectionStrategy class >> dependenciesAtReceiverScopeOf: anEntity [
	^ anEntity allClients
]

{ #category : #'*Moose-Core' }
MQNavigationIncomingDirectionStrategy class >> dependenciesOf: aMooseEntity [
	^ aMooseEntity query incoming dependencies
]
