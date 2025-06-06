Extension { #name : #TEntityMetaLevelDependency }

{ #category : #'*Moose-Core' }
TEntityMetaLevelDependency >> deadChildren [
	self isContainerEntity ifFalse: [ self error: 'Only entitier containing other entities can call this method.' ].
	^ self children select: #isDead
]

{ #category : #'*Moose-Core' }
TEntityMetaLevelDependency >> isDead [
	"Only container entities and behaviourals can be dead"

	<FMProperty: #isDead type: #Boolean>
	<derived>
	<FMComment: 'Is the entity dead (not invoked in the system)'>
	^ self allClients isEmpty.
]

{ #category : #'*Moose-Core' }
TEntityMetaLevelDependency >> numberOfDeadChildren [
	<FMProperty: #numberOfDeadChildren type: #Number>
	<FMComment: 'Number of Dead Functions'>
	<derived>
	^ self deadChildren size
]
