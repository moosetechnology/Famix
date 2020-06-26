Extension { #name : #FamixJavaMethod }

{ #category : #'*Moose-Query-Extensions' }
FamixJavaMethod >> queryIncomingInheritances [
	^ self queryIncoming: FamixOOTInheritance
]

{ #category : #'*Moose-Query-Extensions' }
FamixJavaMethod >> queryOutgoingInheritances [
	^ self queryOutgoing: FamixOOTInheritance
]
