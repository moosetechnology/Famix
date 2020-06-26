Extension { #name : #FamixTNamespace }

{ #category : #'*Moose-Query-Extensions' }
FamixTNamespace >> queryIncomingInheritances [
	^ self queryIncoming: FamixOOTInheritance
]

{ #category : #'*Moose-Query-Extensions' }
FamixTNamespace >> queryOutgoingInheritances [
	^ self queryOutgoing: FamixOOTInheritance
]
