Extension { #name : #TDependencyQueries }

{ #category : #'*Famix-Deprecated' }
TDependencyQueries >> queryIncomingDependencies [
	self deprecated: 'Use #queryAllIncoming' transformWith: '`@receiver queryIncomingDependencies' -> '`@receiver queryAllIncoming'.
	^ self queryAllIncoming
]

{ #category : #'*Famix-Deprecated' }
TDependencyQueries >> queryOutgoingDependencies [
	self deprecated: 'Use #queryAllOutgoing' transformWith: '`@receiver queryOutgoingDependencies' -> '`@receiver queryAllOutgoing'.

	^ self queryAllOutgoing
]
