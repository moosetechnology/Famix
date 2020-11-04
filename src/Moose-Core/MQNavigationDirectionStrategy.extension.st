Extension { #name : #MQNavigationDirectionStrategy }

{ #category : #'*Moose-Core' }
MQNavigationDirectionStrategy class >> dependenciesAtReceiverScopeOf: enEntity [
	^ self subclassResponsibility
]

{ #category : #'*Moose-Core' }
MQNavigationDirectionStrategy class >> dependenciesOf: aMooseEntity [
	^ self subclassResponsibility
]
