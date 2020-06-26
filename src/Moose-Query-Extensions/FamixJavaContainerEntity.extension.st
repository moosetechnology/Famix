Extension { #name : #FamixJavaContainerEntity }

{ #category : #'*Moose-Query-Extensions' }
FamixJavaContainerEntity >> queryIncomingInheritances [
	^ self queryIncoming: FamixOOTInheritance
]

{ #category : #'*Moose-Query-Extensions' }
FamixJavaContainerEntity >> queryOutgoingInheritances [
	^ self queryOutgoing: FamixOOTInheritance
]
