Extension { #name : #TEntityMetaLevelDependency }

{ #category : #'*Moose-Query-Extensions' }
TEntityMetaLevelDependency >> queryAllIncomingInvocations [
	^ self queryIncoming: FamixTInvocation
]

{ #category : #'*Moose-Query-Extensions' }
TEntityMetaLevelDependency >> queryAllOutgoingInvocations [
	^ self queryOutgoing: FamixTInvocation
]

{ #category : #'*Moose-Query-Extensions' }
TEntityMetaLevelDependency >> queryIncomingAccesses [
	^ self queryIncoming: FamixTAccess
]

{ #category : #'*Moose-Query-Extensions' }
TEntityMetaLevelDependency >> queryIncomingInheritances [
	^ self queryIncoming: FamixTInheritance
]

{ #category : #'*Moose-Query-Extensions' }
TEntityMetaLevelDependency >> queryIncomingReferences [
	^ self queryIncoming: FamixTReference
]

{ #category : #'*Moose-Query-Extensions' }
TEntityMetaLevelDependency >> queryOutgoingAccesses [
	^ self queryOutgoing: FamixTAccess
]

{ #category : #'*Moose-Query-Extensions' }
TEntityMetaLevelDependency >> queryOutgoingInheritances [
	^ self queryOutgoing: FamixTInheritance
]

{ #category : #'*Moose-Query-Extensions' }
TEntityMetaLevelDependency >> queryOutgoingReferences [
	^ self queryOutgoing: FamixTReference
]