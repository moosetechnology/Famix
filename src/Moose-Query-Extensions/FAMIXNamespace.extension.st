Extension { #name : #FAMIXNamespace }

{ #category : #'*Moose-Query-Extensions' }
FAMIXNamespace >> queryIncomingInheritances [
	^ self queryIncoming: FamixOOTInheritance
]

{ #category : #'*Moose-Query-Extensions' }
FAMIXNamespace >> queryOutgoingInheritances [
	^ self queryOutgoing: FamixOOTInheritance
]
