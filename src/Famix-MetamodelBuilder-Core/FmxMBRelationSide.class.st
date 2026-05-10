"
Represents a property referencing another entity
"
Class {
	#name : 'FmxMBRelationSide',
	#superclass : 'FmxMBProperty',
	#traits : 'FmxMBRelationSideTrait',
	#classTraits : 'FmxMBRelationSideTrait classTrait',
	#instVars : [
		'cardinality',
		'trait',
		'container',
		'relatedClass',
		'derived',
		'source',
		'target',
		'oppositeSide'
	],
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'visitor' }
FmxMBRelationSide >> acceptVisitor: aVisitor [

	<ignoreForCoverage>
	^ aVisitor visitRelation: self.
]

{ #category : 'converting' }
FmxMBRelationSide >> asRelationSideNamed: aPropertyName [

	"ignore the proposed name"
	^ self 
]

{ #category : 'accessing' }
FmxMBRelationSide >> cardinality [
	^ cardinality
]

{ #category : 'accessing' }
FmxMBRelationSide >> cardinality: anObject [
	cardinality := anObject
]

{ #category : 'properties' }
FmxMBRelationSide >> container [

	container := true
]

{ #category : 'accessing' }
FmxMBRelationSide >> container: anObject [
	container := anObject
]

{ #category : 'properties' }
FmxMBRelationSide >> derived [
	derived := true
]

{ #category : 'properties' }
FmxMBRelationSide >> derived: anObject [
	derived := anObject
]

{ #category : 'initialization' }
FmxMBRelationSide >> initialize [
	super initialize.

	cardinality := #one.
	container := false.
	derived := false.
	target := false.
	source := false
]

{ #category : 'properties' }
FmxMBRelationSide >> isContainer [

	^ container
]

{ #category : 'properties' }
FmxMBRelationSide >> isDerived [

	^ derived
]

{ #category : 'testing' }
FmxMBRelationSide >> isMany [

	^ self cardinality = #many
]

{ #category : 'testing' }
FmxMBRelationSide >> isOne [

	^ self cardinality = #one
]

{ #category : 'testing' }
FmxMBRelationSide >> isRelation [
	^ true
]

{ #category : 'testing' }
FmxMBRelationSide >> isRemote [

	^ self relatedClass isRemote
]

{ #category : 'properties' }
FmxMBRelationSide >> isSource [

	^ source
]

{ #category : 'properties' }
FmxMBRelationSide >> isTarget [

	^ target
]

{ #category : 'converting' }
FmxMBRelationSide >> makeRemote [

	self isRemote: true
]

{ #category : 'accessing' }
FmxMBRelationSide >> many [

	cardinality := #many
]

{ #category : 'properties' }
FmxMBRelationSide >> noContainer [
	
	container := false
]

{ #category : 'properties' }
FmxMBRelationSide >> notDerived [
	
	derived := false
]

{ #category : 'accessing' }
FmxMBRelationSide >> one [

	cardinality := #one
]

{ #category : 'accessing' }
FmxMBRelationSide >> oppositeClass [

	^ oppositeSide relatedEntity
]

{ #category : 'accessing' }
FmxMBRelationSide >> oppositeName [
	^ self oppositeSide name asSymbol
]

{ #category : 'accessing' }
FmxMBRelationSide >> oppositeSide [
	^ oppositeSide
]

{ #category : 'accessing' }
FmxMBRelationSide >> oppositeSide: anObject [
	"We keep an opposite relation bidirectional"

	oppositeSide := anObject.
	anObject oppositeSide = self ifFalse: [ anObject oppositeSide: self ]
]

{ #category : 'accessing' }
FmxMBRelationSide >> oppositeType [
	^ (self oppositeSide builder configuration prefix , self oppositeSide relatedEntityName) asSymbol
]

{ #category : 'private' }
FmxMBRelationSide >> pluralPropertyName [

	^ self propertyName
]

{ #category : 'printing' }
FmxMBRelationSide >> producesSlot [
	"I produce a slot if one of the side is remote. Else we will use the attribute mecanism"

	self relatedClass isRemote ifTrue: [ ^ false ].

	^ self oppositeClass isRemote not
]

{ #category : 'private' }
FmxMBRelationSide >> propertyName [

	^ self relatedClass propertyName
]

{ #category : 'accessing' }
FmxMBRelationSide >> relatedClass [
	^ relatedClass
]

{ #category : 'accessing' }
FmxMBRelationSide >> relatedClass: anObject [
	relatedClass := anObject
]

{ #category : 'accessing' }
FmxMBRelationSide >> relatedEntity [

	^ trait ifNil: [ relatedClass ]
]

{ #category : 'accessing' }
FmxMBRelationSide >> relatedEntityName [

	^ self relatedEntity name
]

{ #category : 'accessing' }
FmxMBRelationSide >> remoteBuilderDo: aBlock [

	self relatedEntity additionalProperties at: #remoteBuilder ifPresent: aBlock
]

{ #category : 'accessing' }
FmxMBRelationSide >> shortCardinalityString [

	^ self isMany
		  ifTrue: [ '*' ]
		  ifFalse: [ '' ]
]

{ #category : 'accessing' }
FmxMBRelationSide >> sides [

	^ {
		  self.
		  self oppositeSide }
]

{ #category : 'name conversion' }
FmxMBRelationSide >> singularPropertyName [

	| normalizedName uncapitalized aName |
	
	aName := self propertyName.
	
	normalizedName := ((aName size >= 2) 
		and: [ ((aName first:2) allSatisfy: #isUppercase)
		and: [ aName beginsWith: 'T' ] ])
			ifTrue: [ aName withoutPrefix: 'T' ]
			ifFalse: [ aName ].	
	
	uncapitalized := normalizedName uncapitalized.
	
	^ uncapitalized

]

{ #category : 'generating' }
FmxMBRelationSide >> slotExpression [

	^ (cardinality = #one
		   ifTrue: [ 'FMOne' ]
		   ifFalse: [ 'FMMany' ]) , ' type: #' , self oppositeType , ' opposite: #' , self oppositeName
]

{ #category : 'properties' }
FmxMBRelationSide >> source [

	source := true.
]

{ #category : 'properties' }
FmxMBRelationSide >> source: aBoolean [
	source := aBoolean
]

{ #category : 'properties' }
FmxMBRelationSide >> target [

	target := true.
]

{ #category : 'properties' }
FmxMBRelationSide >> target: anObject [
	target := anObject
]

{ #category : 'accessing' }
FmxMBRelationSide >> trait [
	^ trait
]

{ #category : 'accessing' }
FmxMBRelationSide >> trait: anObject [
	self relatedEntity ifNotNil: [ :aRelatedEntity | aRelatedEntity removeRelationSide: self ].
	trait := anObject.
	trait addRelationSide: self
]

{ #category : 'accessing' }
FmxMBRelationSide >> type [

	^ (self builder configuration prefix , self relatedEntityName) asSymbol
]

{ #category : 'generating' }
FmxMBRelationSide >> validate [
	"Nothing to validate here"

	
]
