Extension { #name : #UndefinedObject }

{ #category : #'*Moose-Query' }
UndefinedObject >> privateAtScopeIn: aCollection [
	^ MooseQueryCurrentContext result
]

{ #category : #'*Moose-Query' }
UndefinedObject >> privateToScopeIn: aCollection [
	^ MooseQueryCurrentContext result
]

{ #category : #'*Moose-Query' }
UndefinedObject >> privateWithScopeIn: aCollection [
	^ MooseQueryCurrentContext result
]
