Extension { #name : #FamixTMethod }

{ #category : #'*Moose-Query-Extensions' }
FamixTMethod >> queryIncomingInheritances [
	^ self queryIncoming: FamixOOTInheritance
]

{ #category : #'*Moose-Query-Extensions' }
FamixTMethod >> queryOutgoingInheritances [
	^ self queryOutgoing: FamixOOTInheritance
]
