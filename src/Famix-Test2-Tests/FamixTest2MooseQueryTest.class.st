Class {
	#name : 'FamixTest2MooseQueryTest',
	#superclass : 'FamixTest2SimpleModelTest',
	#category : 'Famix-Test2-Tests',
	#package : 'Famix-Test2-Tests'
}

{ #category : 'running' }
FamixTest2MooseQueryTest >> checkAtScopeWithNonMatchingEntitiesDoWith: aBehavior [
	| mooseQueryResult nonMatching |
	mooseQueryResult := MooseOutgoingQueryResult on: self c1 withAll: {self ref1 . self inv1}.

	nonMatching := Set new.
	self
		assertCollection: (mooseQueryResult atScope: aBehavior withNonMatchingEntitiesDo: [ :entities :matchingAtTheScope |
			entities isCollection
				ifTrue: [ nonMatching addAll: entities ]
				ifFalse: [ nonMatching add: entities ]
 			])
		hasSameElements: {self c1}.
	self assertCollection: nonMatching hasSameElements: {self pt1}
]

{ #category : 'tests' }
FamixTest2MooseQueryTest >> testAllClients [
	self assertCollection: self pt1 allClients hasSameElements: {self m1}

]

{ #category : 'tests' }
FamixTest2MooseQueryTest >> testAllClientsAtScope [
	self assertCollection: (self pt1 allClientsAtScope: FamixTClass) hasSameElements: {self c1}.
	self assertCollection: (self pt1 allClientsAtScope: FamixTest2Class) hasSameElements: {self c1}
]

{ #category : 'tests' }
FamixTest2MooseQueryTest >> testAllProviders [
	self assertCollection: self m1 allProviders hasSameElements: {self c1 . self pt1}
]

{ #category : 'tests' }
FamixTest2MooseQueryTest >> testAllProvidersAtScope [
	self assertCollection: (self m1 allProviders) hasSameElements: {self c1 . self pt1}.
	self assertCollection: (self m1 allProviders) hasSameElements: {self c1 . self pt1}
]

{ #category : 'tests' }
FamixTest2MooseQueryTest >> testAtScopeOnQueryResult [

	| mooseQueryResult |
	mooseQueryResult := MooseObjectQueryResult on: self c1 withAll: {
			                    self m1.
			                    self m2.
			                    self pt1.
			                    self pt2 }.

	self assertCollection: (mooseQueryResult containersOfType: FamixTClass) hasSameElements: {
			self c1.
			self c2 }.
	self assertCollection: (mooseQueryResult containersOfType: FamixTest2Class) hasSameElements: {
			self c1.
			self c2 }
]

{ #category : 'tests' }
FamixTest2MooseQueryTest >> testAtScopeWithNonMatchingEntitiesDo [
	self checkAtScopeWithNonMatchingEntitiesDoWith: FamixTClass.
	self checkAtScopeWithNonMatchingEntitiesDoWith: FamixTest2Class
]

{ #category : 'tests' }
FamixTest2MooseQueryTest >> testContainedEntityTypes [

	self assertCollection: self c1 containedEntityTypes hasSameElements: {
			FamixTAttribute.
			FamixTMethod.
			FamixTest2Attribute.
			FamixTest2Method.
			FamixTComment.
			FamixTest2Comment }
]

{ #category : 'tests' }
FamixTest2MooseQueryTest >> testContainerTypes [

	self assertCollection: self m1 containerTypes hasSameElements: {
			FamixTWithMethods.
			FamixTest2Class.
			FamixTest2ParametricClass }
]

{ #category : 'tests' }
FamixTest2MooseQueryTest >> testContainersOfType [

	self assertCollection: (self m1 containersOfType: FamixTClass) hasSameElements: { self c1 }.
	self assertCollection: (self m1 containersOfType: FamixTest2Class) hasSameElements: { self c1 }
]

{ #category : 'tests' }
FamixTest2MooseQueryTest >> testIncomingReferences [
	self assertCollection: self pt1 incomingReferences hasSameElements: {self ref1}
]

{ #category : 'tests' }
FamixTest2MooseQueryTest >> testNumberOfExternalClients [
	| m3 |
	m3 := FamixTest2Method named: 'm3' model: model.
	FamixTest2Invocation source: m3 target: {self m1} model: model.
	m3 parentType: self c1.
	self assertCollection: self pt1 allClients hasSameElements: {self m1}.
	self assert: self pt1 numberOfExternalClients equals: 1.
]

{ #category : 'tests' }
FamixTest2MooseQueryTest >> testNumberOfExternalProviders [
	| m3 |
	m3 := FamixTest2Method named: 'm3' model: model.
	FamixTest2Invocation source: self m1 target: {m3} model: model.
	m3 parentType: self c1.
	
	self assertCollection: self m1 allProviders hasSameElements: {self c1 . self pt1. m3}.
	self assert: self m1 numberOfExternalProviders equals: 2.
]

{ #category : 'tests' }
FamixTest2MooseQueryTest >> testNumberOfInternalClients [
	| m3 |
	m3 := FamixTest2Method named: 'm3' model: model.
	FamixTest2Invocation source: m3 target: {self m1} model: model.
	m3 parentType: self c1.
	self assertCollection: self pt1 allClients hasSameElements: {self m1}.
	self assert: self m1 numberOfInternalClients equals: 1.
]

{ #category : 'tests' }
FamixTest2MooseQueryTest >> testNumberOfInternalProviders [
	| m3 |
	m3 := FamixTest2Method named: 'm3' model: model.
	FamixTest2Invocation source: self m1 target: {m3} model: model.
	m3 parentType: self c1.
	
	self assertCollection: self m1 allProviders hasSameElements: {self c1 . self pt1. m3}.
	self assert: self m1 numberOfInternalProviders equals: 1.
]

{ #category : 'tests' }
FamixTest2MooseQueryTest >> testQueryIncomingDependencies [
	self assertCollection: self pt1 queryAllIncoming hasSameElements: {self ref1}
]
