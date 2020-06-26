Extension { #name : #FamixStNamespace }

{ #category : #'*Moose-Query-Extensions' }
FamixStNamespace >> queryIncomingInheritances [
	^ self queryIncoming: FamixOOTInheritance
]

{ #category : #'*Moose-Query-Extensions' }
FamixStNamespace >> queryOutgoingInheritances [
	^ self queryOutgoing: FamixOOTInheritance
]
