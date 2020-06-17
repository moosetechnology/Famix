Extension { #name : #FMMultivalueLink }

{ #category : #'*Moose-Query' }
FMMultivalueLink >> allAtScopeIn: aCollection [
	^ values allAtScopeIn: aCollection
]

{ #category : #'*Moose-Query' }
FMMultivalueLink >> allToScopeIn: aCollection [
	^ values allToScopeIn: aCollection
]

{ #category : #'*Moose-Query' }
FMMultivalueLink >> allWithScope: aFAMIXClass in: aCollection [
	^ values allWithScope: aFAMIXClass in: aCollection
]

{ #category : #'*Moose-Query' }
FMMultivalueLink >> atScopeIn: aCollection [
	^ values atScopeIn: aCollection
]

{ #category : #'*Moose-Query' }
FMMultivalueLink >> toScopeIn: aCollection [
	^ values toScopeIn: aCollection
]

{ #category : #'*Moose-Query' }
FMMultivalueLink >> withScopeIn: aCollection [
	^ values withScopeIn: aCollection
]
