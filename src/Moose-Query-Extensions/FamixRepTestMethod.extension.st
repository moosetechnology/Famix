Extension { #name : #FamixRepTestMethod }

{ #category : #'*Moose-Query-Extensions' }
FamixRepTestMethod >> queryIncomingInheritances [
	^ self queryIncoming: FamixOOTInheritance
]

{ #category : #'*Moose-Query-Extensions' }
FamixRepTestMethod >> queryOutgoingInheritances [
	^ self queryOutgoing: FamixOOTInheritance
]
