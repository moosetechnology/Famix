Extension { #name : #FamixStPackage }

{ #category : #'*Moose-Query-Extensions' }
FamixStPackage >> queryIncomingInheritances [
	^ self queryIncoming: FamixOOTInheritance
]

{ #category : #'*Moose-Query-Extensions' }
FamixStPackage >> queryOutgoingInheritances [
	^ self queryOutgoing: FamixOOTInheritance
]
