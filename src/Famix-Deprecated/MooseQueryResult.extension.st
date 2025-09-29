Extension { #name : 'MooseQueryResult' }

{ #category : '*Famix-Deprecated' }
MooseQueryResult >> allWithAnyScope: aCollectionOfFamixClasses [

	self deprecated: 'This query taking parents and children has been deprecated. You should use a scope up or a scope down instead.'.
	^ self executeScopeQuery: (MQScopeQuery recursivelyScopes: aCollectionOfFamixClasses direction: MQScopeAllStrategy)
]

{ #category : '*Famix-Deprecated' }
MooseQueryResult >> allWithScope: aClassFamix [

	self deprecated: 'This query taking parents and children has been deprecated. You should use a scope up or a scope down instead.'.
	^ self executeScopeQuery: (MQScopeQuery recursivelyScope: aClassFamix direction: MQScopeAllStrategy)
]

{ #category : '*Famix-Deprecated' }
MooseQueryResult >> withAnyScope: aCollectionOfFamixClasses [

	self deprecated: 'This query taking parents and children has been deprecated. You should use a scope up or a scope down instead.'.
	^ self executeScopeQuery: (MQScopeQuery scopes: aCollectionOfFamixClasses direction: MQScopeAllStrategy)
]

{ #category : '*Famix-Deprecated' }
MooseQueryResult >> withScope: aClassFamix [

	self deprecated: 'This query taking parents and children has been deprecated. You should use a scope up or a scope down instead.'.
	^ self executeScopeQuery: (MQScopeQuery scope: aClassFamix direction: MQScopeAllStrategy)
]
