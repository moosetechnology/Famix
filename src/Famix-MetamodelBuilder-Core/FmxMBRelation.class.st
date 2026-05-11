"
Represents a property referencing another entity
"
Class {
	#name : 'FmxMBRelation',
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
FmxMBRelation >> acceptVisitor: aVisitor [

	<ignoreForCoverage>
	^ aVisitor visitRelation: self.
]

{ #category : 'converting' }
FmxMBRelation >> asRelationNamed: aPropertyName [

	"ignore the proposed name"
	^ self 
]

{ #category : 'accessing' }
FmxMBRelation >> cardinality [
	^ cardinality
]

{ #category : 'accessing' }
FmxMBRelation >> cardinality: anObject [
	cardinality := anObject
]

{ #category : 'properties' }
FmxMBRelation >> container [

	container := true
]

{ #category : 'accessing' }
FmxMBRelation >> container: anObject [
	container := anObject
]

{ #category : 'properties' }
FmxMBRelation >> derived [
	derived := true
]

{ #category : 'properties' }
FmxMBRelation >> derived: anObject [
	derived := anObject
]

{ #category : 'initialization' }
FmxMBRelation >> initialize [
	super initialize.

	cardinality := #one.
	container := false.
	derived := false.
	target := false.
	source := false
]

{ #category : 'properties' }
FmxMBRelation >> isContainer [

	^ container
]

{ #category : 'properties' }
FmxMBRelation >> isDerived [

	^ derived
]

{ #category : 'testing' }
FmxMBRelation >> isMany [

	^ self cardinality = #many
]

{ #category : 'testing' }
FmxMBRelation >> isOne [

	^ self cardinality = #one
]

{ #category : 'testing' }
FmxMBRelation >> isRelation [
	^ true
]

{ #category : 'testing' }
FmxMBRelation >> isRemote [

	^ self relatedClass isRemote
]

{ #category : 'properties' }
FmxMBRelation >> isSource [

	^ source
]

{ #category : 'properties' }
FmxMBRelation >> isTarget [

	^ target
]

{ #category : 'converting' }
FmxMBRelation >> makeRemote [

	self isRemote: true
]

{ #category : 'accessing' }
FmxMBRelation >> many [

	cardinality := #many
]

{ #category : 'properties' }
FmxMBRelation >> noContainer [
	
	container := false
]

{ #category : 'properties' }
FmxMBRelation >> notDerived [
	
	derived := false
]

{ #category : 'accessing' }
FmxMBRelation >> one [

	cardinality := #one
]

{ #category : 'accessing' }
FmxMBRelation >> oppositeClass [

	^ oppositeSide relatedEntity
]

{ #category : 'accessing' }
FmxMBRelation >> oppositeName [
	^ self oppositeSide name asSymbol
]

{ #category : 'accessing' }
FmxMBRelation >> oppositeSide [
	^ oppositeSide
]

{ #category : 'accessing' }
FmxMBRelation >> oppositeSide: anObject [
	"We keep an opposite relation bidirectional"

	oppositeSide := anObject.
	anObject oppositeSide = self ifFalse: [ anObject oppositeSide: self ]
]

{ #category : 'accessing' }
FmxMBRelation >> oppositeType [

	^ (self oppositeClass prefix , self oppositeSide relatedEntityName) asSymbol
]

{ #category : 'private' }
FmxMBRelation >> pluralPropertyName [

	^ self propertyName
]

{ #category : 'printing' }
FmxMBRelation >> producesSlot [
	"I produce a slot if one of the side is remote. Else we will use the attribute mecanism"

	self relatedClass isRemote ifTrue: [ ^ false ].

	^ self oppositeClass isRemote not
]

{ #category : 'private' }
FmxMBRelation >> propertyName [

	^ self relatedClass propertyName
]

{ #category : 'accessing' }
FmxMBRelation >> relatedClass [
	^ relatedClass
]

{ #category : 'accessing' }
FmxMBRelation >> relatedClass: anObject [
	relatedClass := anObject
]

{ #category : 'accessing' }
FmxMBRelation >> relatedEntity [

	^ trait ifNil: [ relatedClass ]
]

{ #category : 'accessing' }
FmxMBRelation >> relatedEntityName [

	^ self relatedEntity name
]

{ #category : 'accessing' }
FmxMBRelation >> remoteBuilderDo: aBlock [

	self relatedEntity additionalProperties at: #remoteBuilder ifPresent: aBlock
]

{ #category : 'accessing' }
FmxMBRelation >> shortCardinalityString [

	^ self isMany
		  ifTrue: [ '*' ]
		  ifFalse: [ '' ]
]

{ #category : 'accessing' }
FmxMBRelation >> sides [

	^ {
		  self.
		  self oppositeSide }
]

{ #category : 'name conversion' }
FmxMBRelation >> singularPropertyName [

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
FmxMBRelation >> slotExpression [

	^ (cardinality = #one
		   ifTrue: [ 'FMOne' ]
		   ifFalse: [ 'FMMany' ]) , ' type: #' , self oppositeType , ' opposite: #' , self oppositeName
]

{ #category : 'properties' }
FmxMBRelation >> source [

	source := true.
]

{ #category : 'properties' }
FmxMBRelation >> source: aBoolean [
	source := aBoolean
]

{ #category : 'properties' }
FmxMBRelation >> target [

	target := true.
]

{ #category : 'properties' }
FmxMBRelation >> target: anObject [
	target := anObject
]

{ #category : 'accessing' }
FmxMBRelation >> trait [
	^ trait
]

{ #category : 'accessing' }
FmxMBRelation >> trait: anObject [
	self relatedEntity ifNotNil: [ :aRelatedEntity | aRelatedEntity removeRelation: self ].
	trait := anObject.
	trait addRelation: self
]

{ #category : 'accessing' }
FmxMBRelation >> type [

	^ (self relatedClass prefix , self relatedEntityName) asSymbol
]

{ #category : 'generating' }
FmxMBRelation >> validate [
	"Nothing to validate here"

	
]
