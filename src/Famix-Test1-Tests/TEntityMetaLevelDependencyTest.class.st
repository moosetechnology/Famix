Class {
	#name : 'TEntityMetaLevelDependencyTest',
	#superclass : 'FamixTest1SimpleModelTest',
	#category : 'Famix-Test1-Tests',
	#package : 'Famix-Test1-Tests'
}

{ #category : 'tests' }
TEntityMetaLevelDependencyTest >> testAddAllChildrenIn [
	| aCollection |
	aCollection := Set new.
	c1 addAllChildrenIn: aCollection.
	self assertCollection: aCollection hasSameElements: {m1 . a1}
]

{ #category : 'tests' }
TEntityMetaLevelDependencyTest >> testAddAllContainersIn [

	| aCollection |
	
	aCollection := Set new.
	m1 addAllContainersIn: aCollection.
	self assertCollection: aCollection hasSameElements: { c1 }.
]

{ #category : 'tests' }
TEntityMetaLevelDependencyTest >> testAllAtScope [

	| aCollection |
	
	aCollection := m1 allAtScope: FamixTMethod.
	self assertCollection: aCollection hasSameElements: { m1 }.
	aCollection := m1 allAtScope: FamixTest1Method.
	self assertCollection: aCollection hasSameElements: { m1 }.

	aCollection := m1 allAtScope: FamixTClass.
	self assertCollection: aCollection hasSameElements: { c1 }.
	aCollection := m1 allAtScope: FamixTest1Class.
	self assertCollection: aCollection hasSameElements: { c1 }.
	
	aCollection := m1 allAtScope: FamixTest1SourceAnchor.
	self assertCollection: aCollection hasSameElements: { }.
	
]

{ #category : 'tests' }
TEntityMetaLevelDependencyTest >> testAllChildren [
	self assertCollection: c1 allChildren hasSameElements: {m1 . a1}.
	self assertCollection: c2 allChildren hasSameElements: {m2 . m3}.
	self assertCollection: m1 allChildren hasSameElements: {}
]

{ #category : 'tests' }
TEntityMetaLevelDependencyTest >> testAllChildrenTypes [

	self assertCollection: c1 allChildrenTypes hasSameElements: {
			FamixTParameter.
			FamixTImplicitVariable.
			FamixTest1Attribute.
			FamixTAttribute.
			FamixTest1Method.
			FamixTLocalVariable.
			FamixTMethod.
			FamixTComment.
			FamixTest1Comment }.
	self assertCollection: c2 allChildrenTypes hasSameElements: {
			FamixTParameter.
			FamixTImplicitVariable.
			FamixTest1Attribute.
			FamixTAttribute.
			FamixTest1Method.
			FamixTLocalVariable.
			FamixTMethod.
			FamixTComment.
			FamixTest1Comment }.
	self assertCollection: m1 allChildrenTypes hasSameElements: {
			FamixTImplicitVariable.
			FamixTParameter.
			FamixTLocalVariable.
			FamixTComment.
			FamixTest1Comment }
]

{ #category : 'tests' }
TEntityMetaLevelDependencyTest >> testAllContainerTypes [

	self assertCollection: c1 allContainerTypes hasSameElements: {
			FamixTWithTypes.
			FamixTPackage }.
	self assertCollection: m1 allContainerTypes hasSameElements: {
			FamixTest1Class.
			FamixTWithMethods.
			FamixTWithTypes.
			FamixTPackage }
]

{ #category : 'tests' }
TEntityMetaLevelDependencyTest >> testAllContainers [

	self assertCollection: c1 allContainers hasSameElements: {  }.
	self assertCollection: c2 allContainers hasSameElements: {  }.
	self assertCollection: m1 allContainers hasSameElements: { c1 }
]

{ #category : 'tests' }
TEntityMetaLevelDependencyTest >> testAllIncomingAssociationTypes [

	self
		assertCollection: c1 allIncomingAssociationTypes
		hasSameElements: {
				FamixTInheritance.
				FamixTInvocation.
				FamixTAccess.
				FamixTReference.
				FamixTEntityTyping }
]

{ #category : 'tests' }
TEntityMetaLevelDependencyTest >> testAllOutgoingAssociationTypes [

	self
		assertCollection: c1 allOutgoingAssociationTypes
		hasSameElements: {
				FamixTInheritance.
				FamixTInvocation.
				FamixTAccess.
				FamixTReference.
				FamixTEntityTyping }
]

{ #category : 'tests' }
TEntityMetaLevelDependencyTest >> testAllToScope [

	self assertCollection: (c1 allToScope: FamixTClass) hasSameElements: { c1 }.
	self assertCollection: (c1 allToScope: FamixTest1Class) hasSameElements: { c1 }.

	self assertCollection: (c1 allToScope: FamixTMethod) hasSameElements: { m1 }.
	self assertCollection: (c1 allToScope: FamixTest1Method) hasSameElements: { m1 }.

	self assertCollection: (c2 allToScope: FamixTMethod) hasSameElements: { m2. m3 }.
	self assertCollection: (c2 allToScope: FamixTest1Method) hasSameElements: { m2. m3 }.

	self assertCollection: (c1 allToScope: FamixTSourceAnchor) hasSameElements: { }.
	self assertCollection: (c2 allToScope: FamixTest1SourceAnchor) hasSameElements: { }.

	self assertCollection: (m1 allToScope: FamixTClass) hasSameElements: { }.

]

{ #category : 'tests' }
TEntityMetaLevelDependencyTest >> testBelongsTo [
	self assert: m1 belongsTo equals: c1
]

{ #category : 'tests' }
TEntityMetaLevelDependencyTest >> testChildren [

	self assertCollection: m1 children hasSameElements: { }.
	self assertCollection: c1 children hasSameElements: { m1. a1 }.
	self assertCollection: c2 children hasSameElements: { m2. m3 }.
]

{ #category : 'tests' }
TEntityMetaLevelDependencyTest >> testChildrenSelectors [

	self assertCollection: m1 childrenSelectors hasSameElements: { #parameters. #localVariables. #implicitVariables. #comments }.
	self assertCollection: c1 childrenSelectors hasSameElements: { #methods. #attributes. #comments }.
	self assertCollection: c2 childrenSelectors hasSameElements: { #methods. #attributes. #comments }
]

{ #category : 'tests' }
TEntityMetaLevelDependencyTest >> testContainerTypes [

	self assertCollection: m1 containerTypes hasSameElements: {
			FamixTest1Class.
			FamixTWithMethods }.
	self assertCollection: c1 containerTypes hasSameElements: {
			FamixTWithTypes.
			FamixTPackage }
]

{ #category : 'tests' }
TEntityMetaLevelDependencyTest >> testContainers [

	| newMethod |
	self assertCollection: m1 containers hasSameElements: { c1 }.
	self assertCollection: m2 containers hasSameElements: { c2 }.
	self assertCollection: m3 containers hasSameElements: { c2 }.

	newMethod := FamixTest1Method new.
	self assertEmpty: newMethod containers
]

{ #category : 'tests' }
TEntityMetaLevelDependencyTest >> testIncomingAssociationTypes [

	self
		assertCollection: c1 allIncomingAssociationTypes
		hasSameElements: {
				FamixTInheritance.
				FamixTInvocation.
				FamixTAccess.
				FamixTReference.
				FamixTEntityTyping }
]

{ #category : 'tests' }
TEntityMetaLevelDependencyTest >> testNumberOfChildren [
	self assert: c1 numberOfChildren equals: 2.
	self assert: c2 numberOfChildren equals: 2.
	self assert: m1 numberOfChildren equals: 0.
	self assert: a1 numberOfChildren equals: 0
]

{ #category : 'tests' }
TEntityMetaLevelDependencyTest >> testOutgoingAssociationTypes [

	self
		assertCollection: c1 allOutgoingAssociationTypes
		hasSameElements: {
				FamixTInheritance.
				FamixTInvocation.
				FamixTAccess.
				FamixTReference.
				FamixTEntityTyping }
]

{ #category : 'tests' }
TEntityMetaLevelDependencyTest >> testRootContainers [

	self assertCollection: c1 rootContainers hasSameElements: {  }.
	self assertCollection: c2 rootContainers hasSameElements: {  }.
	self assertCollection: m1 rootContainers hasSameElements: { c1 }
]
