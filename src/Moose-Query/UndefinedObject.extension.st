Extension { #name : #UndefinedObject }

{ #category : #'*Moose-Query' }
UndefinedObject >> atScopeIn: aCollection [
	^ MooseQueryCurrentContext result
]

{ #category : #'*Moose-Query' }
UndefinedObject >> toScopeIn: aCollection [
	^ MooseQueryCurrentContext result
]

{ #category : #'*Moose-Query' }
UndefinedObject >> withScopeIn: aCollection [
	^ MooseQueryCurrentContext result
]
