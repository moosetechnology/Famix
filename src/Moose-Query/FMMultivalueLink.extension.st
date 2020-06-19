Extension { #name : #FMMultivalueLink }

{ #category : #'*Moose-Query' }
FMMultivalueLink >> atScopeIn: aCollection [
	^ values atScopeIn: MooseQueryCurrentContext result
]

{ #category : #'*Moose-Query' }
FMMultivalueLink >> toScopeIn: aCollection [
	^ values toScopeIn: MooseQueryCurrentContext result
]

{ #category : #'*Moose-Query' }
FMMultivalueLink >> withScopeIn: aCollection [
	^ values withScopeIn: MooseQueryCurrentContext result
]
