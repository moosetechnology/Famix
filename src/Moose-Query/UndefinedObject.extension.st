Extension { #name : #UndefinedObject }

{ #category : #'*Moose-Query' }
UndefinedObject >> atScopeInContext: aContext [
	^ aContext result
]

{ #category : #'*Moose-Query' }
UndefinedObject >> toScopeInContext: aContext [
	^ aContext result
]

{ #category : #'*Moose-Query' }
UndefinedObject >> withScopeIn: aCollection [
	^ MooseQueryCurrentContext result
]
