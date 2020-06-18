Extension { #name : #FMMultivalueLink }

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
