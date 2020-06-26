Extension { #name : #FAMIXClass }

{ #category : #'*Moose-Query-Extensions' }
FAMIXClass >> queryOutgoingInheritances [
	^ self queryOutgoing: FamixOOTInheritance
]
