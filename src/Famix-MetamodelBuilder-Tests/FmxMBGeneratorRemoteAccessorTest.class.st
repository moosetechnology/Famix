Class {
	#name : 'FmxMBGeneratorRemoteAccessorTest',
	#superclass : 'TestCase',
	#instVars : [
		'mm',
		'entityA',
		'entityB'
	],
	#category : 'Famix-MetamodelBuilder-Tests-Tests',
	#package : 'Famix-MetamodelBuilder-Tests',
	#tag : 'Tests'
}

{ #category : 'accessing' }
FmxMBGeneratorRemoteAccessorTest class >> resources [
	^ { FamixGenerateRemoteAccessorTestResource }
]

{ #category : 'running' }
FmxMBGeneratorRemoteAccessorTest >> setUp [
	super setUp.
	entityA := FamixGenerateRemoteAccessorTestResource current entityA.
	entityB := FamixGenerateRemoteAccessorTestResource current entityB
]

{ #category : 'tests' }
FmxMBGeneratorRemoteAccessorTest >> testAddRemoteManyToManyRelation [

	entityA perform: #addManyManyB: with: entityB.
	self assert: ((entityA perform: #manyManyB) includes: entityB).
	self assert: ((entityB perform: #manyManyA) includes: entityA).
	entityB perform: #addManyManyA: with: entityA.
	self assert: (entityA perform: #manyManyB) size equals: 1
]

{ #category : 'tests' }
FmxMBGeneratorRemoteAccessorTest >> testAddRemoteOneToManyRelation [

	| method |
	method := entityA class >> #addManyB:.
	self assert: method package name equals: FamixMetamodelGenerateRemoteAccessorTestGeneratorAB packageName.
	entityA perform: #addManyB: with: entityB.
	self assert: ((entityA perform: #manyB) includes: entityB).
	self assert: (entityB perform: #oneA) identicalTo: entityA
]

{ #category : 'tests' }
FmxMBGeneratorRemoteAccessorTest >> testCanRemoveManyRelationFromEntityA [
	entityA manyB add: entityB.
	entityA manyB removeAll.
	self assertEmpty: entityA manyB.
	self assert: entityB oneA equals: nil.
	entityA manyB add: entityB.
	entityA manyB remove: entityB.
	self assertEmpty: entityA manyB.
	self assert: entityB oneA equals: nil
]

{ #category : 'tests' }
FmxMBGeneratorRemoteAccessorTest >> testCanRemoveMultiMultiRelationFromEntityA [
	entityA manyManyB add: entityB.
	entityA manyManyB removeAll.
	self assertEmpty: entityA manyManyB.
	self assertEmpty: entityB manyManyA.
	entityA manyManyB add: entityB.
	entityA manyManyB remove: entityB.
	self assertEmpty: entityA manyManyB.
	self assertEmpty: entityB manyManyA
]

{ #category : 'tests' }
FmxMBGeneratorRemoteAccessorTest >> testCanRemoveMultiMultiRelationFromEntityB [
	entityB manyManyA add: entityA.
	entityB manyManyA removeAll.
	self assertEmpty: entityA manyManyB.
	self assertEmpty: entityB manyManyA.
	entityB manyManyA add: entityA.
	entityB manyManyA remove: entityA.
	self assertEmpty: entityA manyManyB.
	self assertEmpty: entityB manyManyA
]

{ #category : 'tests' }
FmxMBGeneratorRemoteAccessorTest >> testCanRemoveOneRelationFromEntityB [
	entityB oneA: entityA.
	entityB oneA: nil.
	self assertEmpty: entityA manyB.
	self assert: entityB oneA equals: nil
]

{ #category : 'tests' }
FmxMBGeneratorRemoteAccessorTest >> testCanRemoveRelationFromEntityA [
	entityA relationToB: entityB.
	entityA relationToB: nil.
	self assert: entityA relationToB equals: nil. 
	self assert: entityB relationToA equals: nil.
]

{ #category : 'tests' }
FmxMBGeneratorRemoteAccessorTest >> testCanRemoveRelationFromEntityB [
	entityB relationToA: entityA.
	entityB relationToA: nil.
	self assert: entityB relationToA equals: nil. 
	self assert: entityA relationToB equals: nil.
]

{ #category : 'tests' }
FmxMBGeneratorRemoteAccessorTest >> testCanSetRelationFromEntityA [
	entityA relationToB: entityB.
	self assert: entityA relationToB equals: entityB. 
	self assert: entityB relationToA equals: entityA.
]

{ #category : 'tests' }
FmxMBGeneratorRemoteAccessorTest >> testCanSetRelationFromEntityB [
	entityB relationToA: entityA.
	self assert: entityB relationToA equals: entityA. 
	self assert: entityA relationToB equals: entityB.
]

{ #category : 'tests' }
FmxMBGeneratorRemoteAccessorTest >> testGeneratesSingularAdderForRemoteArguments [

	| generator remoteA remoteB metamodel |
	generator := FamixMetamodelGenerateRemoteAccessorTestGeneratorAB new.
	generator define.
	remoteA := generator remoteEntity: #EntityA withPrefix: #FmxTestGenerateAccessorA.
	remoteB := generator remoteEntity: #EntityB withPrefix: #FmxTestGenerateAccessorB.
	(remoteA property: #arguments) -* (remoteB property: #argumentInSpan).
	[
		metamodel := generator builder buildMetamodel.
		FamixFameMaterializer new materialize: metamodel.
		entityA perform: #addArgument: with: entityB.
		self assert: ((entityA perform: #arguments) includes: entityB).
		self assert: (entityB perform: #argumentInSpan) identicalTo: entityA.
		self assert: (entityA class >> #addArgument: pragmaAt: #package:) arguments first equals: generator packageName ] ensure: [
		FamixMetamodelGenerateRemoteAccessorTestGeneratorAB generate ]
]

{ #category : 'tests' }
FmxMBGeneratorRemoteAccessorTest >> testGeneratorDeclaresNoLocalEntities [

	| generator |
	generator := FamixMetamodelGenerateRemoteAccessorTestGeneratorAB new.
	generator define.
	self assertEmpty: generator builder classes.
	self assertEmpty: generator builder traits
]

{ #category : 'tests' }
FmxMBGeneratorRemoteAccessorTest >> testRemovesObsoleteRemoteRelationMethods [

	| generator metamodel |
	generator := FamixMetamodelGenerateRemoteAccessorTestGeneratorAB new.
	generator define.
	generator subBuilders do: [ :subbuilder |
		subbuilder classes , subbuilder traits do: [ :behavior | behavior propertiesAndRelations removeAll ] ].
	[
		metamodel := generator builder buildMetamodel.
		FamixFameMaterializer new materialize: metamodel.
		self deny: (entityA class includesSelector: #manyB).
		self deny: (entityA class includesSelector: #addManyB:).
		self deny: (entityB class includesSelector: #oneA) ] ensure: [ FamixMetamodelGenerateRemoteAccessorTestGeneratorAB generate ]
]
