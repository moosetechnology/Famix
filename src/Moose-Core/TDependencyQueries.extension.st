Extension { #name : #TDependencyQueries }

{ #category : #'*Moose-Core' }
TDependencyQueries >> deadChildren [
	self isContainerEntity ifFalse: [ self error: 'Only entitier containing other entities can call this method.' ].
	^ self children select: #isDead
]

{ #category : #'*Moose-Core' }
TDependencyQueries >> isDead [
	"Only container entities and behaviourals can be dead"

	<FMProperty: #isDead type: #Boolean>
	<derived>
	<FMComment: 'Is the entity dead (not invoked in the system)'>
	^ self isContainerEntity
		ifTrue: [ self lookUpPropertyNamed: #isDead computedAs: [ self hasIncomingDependencies not or: [ self queryAllIncoming withoutSelfLoops isEmpty ] ] ]
		ifFalse: [ false ]
]

{ #category : #'*Moose-Core' }
TDependencyQueries >> numberOfDeadChildren [
	<FMProperty: #numberOfDeadChildren type: #Number>
	<FMComment: 'Number of Dead Functions'>
	<derived>
	^ self deadChildren size
]
