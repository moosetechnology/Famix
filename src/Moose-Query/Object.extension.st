Extension { #name : #Object }

{ #category : #'*Moose-Query' }
Object >> entityHasIncomingTypeDeclarations [
	^ false
]

{ #category : #'*Moose-Query' }
Object >> entityHasOutgoingTypeDeclarations [
	^ false
]

{ #category : #'*Moose-Query' }
Object >> ifNotBoolean: aBlock [
	^ aBlock value
]
