Extension { #name : #FMMultivalueLink }

{ #category : #'*Moose-Query' }
FMMultivalueLink >> allAtScope: aFAMIXClass in: aCollection [
	^ values allAtScope: aFAMIXClass in: aCollection
]

{ #category : #'*Moose-Query' }
FMMultivalueLink >> allToScope: aFAMIXClass in: aCollection [
	^ values allToScope: aFAMIXClass in: aCollection
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
FMMultivalueLink >> withScope: aFAMIXClass in: aCollection [
	^ values withScope: aFAMIXClass in: aCollection
]
