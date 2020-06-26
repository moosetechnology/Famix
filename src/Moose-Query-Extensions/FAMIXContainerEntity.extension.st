Extension { #name : #FAMIXContainerEntity }

{ #category : #'*Moose-Query-Extensions' }
FAMIXContainerEntity >> queryIncomingInheritances [
	^ self queryIncoming: FamixOOTInheritance
]

{ #category : #'*Moose-Query-Extensions' }
FAMIXContainerEntity >> queryOutgoingInheritances [
	^ self queryOutgoing: FamixOOTInheritance
]
