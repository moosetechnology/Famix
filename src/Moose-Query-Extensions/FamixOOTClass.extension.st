Extension { #name : #FamixOOTClass }

{ #category : #'*Moose-Query-Extensions' }
FamixOOTClass >> queryIncomingInheritances [
	^ self queryIncoming: FamixOOTInheritance
]

{ #category : #'*Moose-Query-Extensions' }
FamixOOTClass >> queryOutgoingInheritances [
	^ self queryOutgoing: FamixOOTInheritance
]
