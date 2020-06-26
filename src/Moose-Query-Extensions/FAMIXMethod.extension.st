Extension { #name : #FAMIXMethod }

{ #category : #'*Moose-Query-Extensions' }
FAMIXMethod >> queryIncomingInheritances [
	^ self queryIncoming: FamixOOTInheritance
]

{ #category : #'*Moose-Query-Extensions' }
FAMIXMethod >> queryOutgoingInheritances [
	^ self queryOutgoing: FamixOOTInheritance
]
