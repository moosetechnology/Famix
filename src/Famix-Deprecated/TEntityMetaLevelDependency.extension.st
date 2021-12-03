Extension { #name : #TEntityMetaLevelDependency }

{ #category : #'*Famix-Deprecated' }
TEntityMetaLevelDependency >> queryIncomingDependencies [
	self deprecated: 'Use #queryAllIncoming' transformWith: '`@receiver queryIncomingDependencies' -> '`@receiver queryAllIncoming'.
	^ self queryAllIncoming
]

{ #category : #'*Famix-Deprecated' }
TEntityMetaLevelDependency >> queryOutgoingDependencies [
	self deprecated: 'Use #queryAllOutgoing' transformWith: '`@receiver queryOutgoingDependencies' -> '`@receiver queryAllOutgoing'.

	^ self queryAllOutgoing
]
