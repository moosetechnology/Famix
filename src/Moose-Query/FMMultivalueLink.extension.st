Extension { #name : #FMMultivalueLink }

{ #category : #'*Moose-Query' }
FMMultivalueLink >> privateAtScopeIn: aCollection [
	^ values privateAtScopeIn: MooseQueryCurrentContext result
]

{ #category : #'*Moose-Query' }
FMMultivalueLink >> privateToScopeIn: aCollection [
	^ values privateToScopeIn: MooseQueryCurrentContext result
]

{ #category : #'*Moose-Query' }
FMMultivalueLink >> privateWithScopeIn: aCollection [
	^ values privateWithScopeIn: MooseQueryCurrentContext result
]
