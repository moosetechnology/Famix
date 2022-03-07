Extension { #name : #TEntityMetaLevelDependency }

{ #category : #'*Cpp-Entities' }
TEntityMetaLevelDependency >> numberOfExternalProviders [
	<FMProperty: #numberOfExternalProviders type: #Number>
	<derived>
	<FMComment: 'Number of call to myself from outside my container.'>
	^ self
		lookUpPropertyNamed: #numberOfExternalProviders
		computedAs: [ (self allProviders reject: [ :entity | entity allParents includesAny: self parents ]) size ]
]

{ #category : #'*Cpp-Entities' }
TEntityMetaLevelDependency >> numberOfInternalProviders [
	<FMProperty: #numberOfInternalProviders type: #Number>
	<derived>
	<FMComment: 'Number of call to myself from entitise from my container.'>
	^ self
		lookUpPropertyNamed: #numberOfInternalProviders
		computedAs: [ (self allProviders select: [ :entity | entity allParents includesAny: self parents ]) size ]
]

{ #category : #'*Cpp-Entities' }
TEntityMetaLevelDependency >> sortedChildrenByPriority [
	^ self children sorted: [ :child1 :child2 | child1 hasPriorityOn: child2 ]
]
