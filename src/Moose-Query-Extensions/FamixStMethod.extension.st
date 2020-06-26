Extension { #name : #FamixStMethod }

{ #category : #'*Moose-Query-Extensions' }
FamixStMethod >> queryIncomingInheritances [
	^ self queryIncoming: FamixOOTInheritance
]

{ #category : #'*Moose-Query-Extensions' }
FamixStMethod >> queryOutgoingInheritances [
	^ self queryOutgoing: FamixOOTInheritance
]
