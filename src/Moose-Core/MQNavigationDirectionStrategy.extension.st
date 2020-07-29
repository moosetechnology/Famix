Extension { #name : #MQNavigationDirectionStrategy }

{ #category : #'*Moose-Core' }
MQNavigationDirectionStrategy classSide >> dependenciesAtReceiverScopeOf: enEntity [
	^ self subclassResponsibility
]

{ #category : #'*Moose-Core' }
MQNavigationDirectionStrategy classSide >> dependenciesOf: aMooseEntity [
	^ self subclassResponsibility
]
