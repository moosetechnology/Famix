Extension { #name : #FamixJavaClass }

{ #category : #'*Moose-Query-Extensions' }
FamixJavaClass >> queryIncomingInheritances [
	^ self queryIncoming: FamixOOTInheritance
]

{ #category : #'*Moose-Query-Extensions' }
FamixJavaClass >> queryOutgoingInheritances [
	^ self queryOutgoing: FamixOOTInheritance
]
