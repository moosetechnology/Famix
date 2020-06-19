Extension { #name : #UndefinedObject }

{ #category : #'*Moose-Query' }
UndefinedObject >> atScopeInContext: aContext [
	^ aContext result
]

{ #category : #'*Moose-Query' }
UndefinedObject >> toScopeIn: aCollection [
	^ MooseQueryCurrentContext result
]

{ #category : #'*Moose-Query' }
UndefinedObject >> withScopeIn: aCollection [
	^ MooseQueryCurrentContext result
]
