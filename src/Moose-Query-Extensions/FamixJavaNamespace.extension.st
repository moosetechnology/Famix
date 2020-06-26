Extension { #name : #FamixJavaNamespace }

{ #category : #'*Moose-Query-Extensions' }
FamixJavaNamespace >> queryIncomingInheritances [
	^ self queryIncoming: FamixOOTInheritance
]

{ #category : #'*Moose-Query-Extensions' }
FamixJavaNamespace >> queryOutgoingInheritances [
	^ self queryOutgoing: FamixOOTInheritance
]
