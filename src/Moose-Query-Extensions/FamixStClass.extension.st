Extension { #name : #FamixStClass }

{ #category : #'*Moose-Query-Extensions' }
FamixStClass >> queryOutgoingInheritances [
	^ self queryOutgoing: FamixOOTInheritance
]
