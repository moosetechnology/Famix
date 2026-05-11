Class {
	#name : 'FmxMBRelationSideTest',
	#superclass : 'FmxMBPropertyTest',
	#category : 'Famix-MetamodelBuilder-Tests-Tests',
	#package : 'Famix-MetamodelBuilder-Tests',
	#tag : 'Tests'
}

{ #category : 'tests' }
FmxMBRelationSideTest >> testBasics [
	"check trivial testing and accessing methods"

	| side |
	side := FmxMBRelation new.

	self assert: side cardinality equals: #one.
	self deny: side isContainer.
	self deny: side isDerived.
	self deny: side isTarget.
	self deny: side isSource.
	self assertEmpty: side comment
]

{ #category : 'tests' }
FmxMBRelationSideTest >> testContainmentRelations [

	| aClass aTrait relation |
	aClass := builder newClassNamed: #AClass.
	aTrait := builder newTraitNamed: #ATrait.

	relation := aClass <>- aTrait.
	self assert: relation isOne.
	self assert: relation oppositeSide isOne.
	self deny: relation isContainer.
	self assert: relation oppositeSide isContainer.

	relation := aClass -<> aTrait.
	self assert: relation isOne.
	self assert: relation oppositeSide isOne.
	self assert: relation isContainer.
	self deny: relation oppositeSide isContainer.

	relation := aClass <>-* aTrait.
	self assert: relation isMany.
	self assert: relation oppositeSide isOne.
	self deny: relation isContainer.
	self assert: relation oppositeSide isContainer.

	relation := aClass *-<> aTrait.
	self assert: relation isOne.
	self assert: relation oppositeSide isMany.
	self assert: relation isContainer.
	self deny: relation oppositeSide isContainer
]

{ #category : 'tests' }
FmxMBRelationSideTest >> testOppositeName [

	| aClass aTrait relation |
	builder configuration prefix: 'Banane'.
	aClass := builder newClassNamed: #AClass.
	aTrait := builder newTraitNamed: #ATrait.

	relation := aClass <>- aTrait.
	self assert: relation oppositeName equals: 'aClass'
]

{ #category : 'tests' }
FmxMBRelationSideTest >> testOppositeType [

	| aClass aTrait relation |
	builder configuration prefix: 'Banane'.
	aClass := builder newClassNamed: #AClass.
	aTrait := builder newTraitNamed: #ATrait.

	relation := aClass <>- aTrait.
	self assert: relation oppositeType equals: 'BananeATrait'
]

{ #category : 'tests' }
FmxMBRelationSideTest >> testOppositeTypeInRemoteBuilder [
	| builder2 aClass aTrait relation |
	builder configuration prefix: 'Banane'.
	
	builder2 := FamixMetamodelBuilder forTesting.
	builder2 configuration prefix: 'Furry'.
	
	aClass := builder newClassNamed: #AClass.
	aTrait := builder2 newTraitNamed: #ATrait.
	
	relation := aClass <>- aTrait.
	self assert: relation oppositeType equals: 'FurryATrait'
]

{ #category : 'tests' }
FmxMBRelationSideTest >> testProperties [

	"simple tests of basic relation side properties"

	| side |
	
	side := FmxMBRelation new.

	self deny: side isContainer.
	side container: true.
	self assert: side isContainer.
	side container: false.
	self deny: side isContainer.
	side container: true.
	side noContainer.
	self deny: side isContainer.

	self deny: side isDerived.
	side derived.
	self assert: side isDerived.
	side derived: false.
	self deny: side isDerived.
	side derived.
	self assert: side isDerived.
	side notDerived.
	self deny: side isDerived.

	self deny: side isSource.
	side source.
	self assert: side isSource.
	side source: false.
	self deny: side isSource.

	self deny: side isTarget.
	side target.
	self assert: side isTarget.
	side target: false.
	self deny: side isTarget.

	self deny: side isTarget.
	side target.
	self assert: side isTarget.
	side target: false.
	self deny: side isTarget.

	self assert: side isOne.
	self deny: side isMany.
	side cardinality: #many.
	self assert: side isMany.
	self deny: side isOne.
	side cardinality: #one.
	self deny: side isMany.
	self assert: side isOne.

]

{ #category : 'tests' }
FmxMBRelationSideTest >> testPropertyReservedName [
	"simple tests of basic relation side properties"

	self should: [ FmxMBRelation new name: 'class' ] raise: FmxMBPropertyNameIsReserved
]

{ #category : 'tests' }
FmxMBRelationSideTest >> testPropertyType [
	"test if after changing of related trait of a relation side all will be consistent"

	| tClass tComment tAccess relation |
	tClass := builder newTraitNamed: #TClass.
	tComment := builder newTraitNamed: #TComment.
	tAccess := builder newTraitNamed: #TAccess.

	(relation := tClass property: #property1) - (tComment property: #property2).

	self assert: relation relatedEntity equals: tClass.
	self assertCollection: tClass relations asArray equals: {relation}.
	self assertEmpty: tAccess relations.

	relation trait: tAccess.

	self assert: relation relatedEntity equals: tAccess.
	self assertEmpty: tClass relations.
	self assertCollection: tAccess relations asArray equals: {relation}
]

{ #category : 'tests' }
FmxMBRelationSideTest >> testReconnection [
	"test if after changing of related trait of a relation side all will be consistent"

	| tClass tComment tAccess relation |
	tClass := builder newTraitNamed: #TClass.
	tComment := builder newTraitNamed: #TComment.
	tAccess := builder newTraitNamed: #TAccess.

	(relation := tClass property: #property1) - (tComment property: #property2).

	self assert: relation relatedEntity equals: tClass.
	self assertCollection: tClass relations asArray equals: { relation }.
	self assertEmpty: tAccess relations.

	relation trait: tAccess.

	self assert: relation trait equals: tAccess.
	self assertEmpty: tClass relations.
	self assertCollection: tAccess relations asArray equals: { relation }
]

{ #category : 'tests' }
FmxMBRelationSideTest >> testRelatedEntity [
	"test setting of a type of the property"

	| aClass aTrait relation |
	aClass := builder newClassNamed: #AClass.
	aTrait := builder newTraitNamed: #ATrait.

	relation := aClass - aTrait.

	self assert: relation relatedEntity equals: aClass.
	self assert: relation oppositeSide relatedEntity equals: aTrait
]

{ #category : 'tests' }
FmxMBRelationSideTest >> testRelations [

	| aClass aTrait relation |
	aClass := builder newClassNamed: #AClass.
	aTrait := builder newTraitNamed: #ATrait.

	relation := aClass - aTrait.
	self assert: relation isOne.
	self assert: relation oppositeSide isOne.
	self deny: relation isContainer | relation oppositeSide isContainer.

	relation := aClass -* aTrait.
	self assert: relation isMany.
	self assert: relation oppositeSide isOne.
	self deny: relation isContainer | relation oppositeSide isContainer.

	relation := aClass *- aTrait.
	self assert: relation isOne.
	self assert: relation oppositeSide isMany.
	self deny: relation isContainer | relation oppositeSide isContainer.

	relation := aClass *-* aTrait.
	self assert: relation isMany.
	self assert: relation oppositeSide isMany.
	self deny: relation isContainer | relation oppositeSide isContainer
]

{ #category : 'tests' }
FmxMBRelationSideTest >> testShortCardinalityString [

	| tClass tMethod relation |
	
	tClass := builder newTraitNamed: #TClass.
	tMethod := builder newTraitNamed: #TMethod.
	
	relation := (tClass <>-* (tMethod property: #methodClass)).
	self assert: relation shortCardinalityString equals: '*'.
	relation := (tClass - (tMethod property: #methodClass)).
	self assert: relation shortCardinalityString equals: ''.
	relation := (tClass *-* tMethod).
	self assert: relation shortCardinalityString equals: '*'.	
]
